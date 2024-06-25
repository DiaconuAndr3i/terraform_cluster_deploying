resource "aws_iam_role" "codebuild_role" {
  name = var.codebuild_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "custom_policy" {
  name        = var.policy_for_codebuild
  description = "My custom policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "codebuild:StartBuild",
                "codebuild:StopBuild",
                "codebuild:RetryBuild",
                "codebuild:BatchGetBuilds",
                "codebuild:BatchDeleteBuilds"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetAuthorizationToken",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:PutObject"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "codecommit:GitPull"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}

resource "aws_iam_role_policy_attachment" "ecr_power_user_policy_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_cloudwatch_log_group" "codebuild_log_group" {
  name              = "/aws/codebuild/${var.codebuild_project_name}"
  retention_in_days = 30
}

resource "aws_codebuild_project" "my_project" {
  name          = var.codebuild_project_name
  description   = "This is my project"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_role.arn

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = var.env_compute_type
    image                       = var.env_image
    type                        = var.env_type
    image_pull_credentials_type = var.env_image_pull_credentials_type
    privileged_mode             = true
  }

  source {
    type            = var.source_type
    location        = var.source_location
    buildspec       = var.source_buildspec
    git_clone_depth = 1
  }

  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.codebuild_log_group.name
      status     = "ENABLED"
    }
  }
}