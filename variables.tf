variable "access_key" {
  description = "Access key"
  type        = string
}

variable "secret_key" {
  description = "Secret key"
  type        = string
}

variable "codecommit_repo_name" { # 
  description = "Repo created with codecommit"
  type        = string
}

variable "codebuild_role_name" { # 
  description = "Codebuild role name"
  type        = string
}

variable "policy_for_codebuild" { # 
  description = "Codebuild role name"
  type        = string
}

variable "codebuild_project_name" { # 
  description = "Codebuild role name"
  type        = string
}

variable "artifacts_type" { # 
  description = "Codebuild role name"
  type        = string
}

variable "env_compute_type" { # 
  description = "Codebuild role name"
  type        = string
}
variable "env_image" { # 
  description = "Codebuild role name"
  type        = string
}
variable "env_type" { # 
  description = "Codebuild role name"
  type        = string
}
variable "env_image_pull_credentials_type" { # 
  description = "Codebuild role name"
  type        = string
}

variable "source_type" { # 
  description = "Codebuild role name"
  type        = string
}

variable "source_buildspec" { # 
  description = "Codebuild role name"
  type        = string
}

variable "ecr_repo_name" { # 
  description = "ECR Repo Name"
  type        = string
}

variable "demo_app_cluster_name" { # 
  description = "ECS Cluster Name"
  type        = string
}

variable "availability_zones" { # 
  description = "eu-north-1 AZs"
  type        = list(string)
}

variable "demo_app_task_famliy" { # 
  description = "ECS Task Family"
  type        = string
}

variable "container_port" { # 
  description = "Container Port"
  type        = number
}

variable "demo_app_task_name" { # 
  description = "ECS Task Name"
  type        = string
}

variable "ecs_task_execution_role_name" { # 
  description = "ECS Task Execution Role Name"
  type        = string
}

variable "application_load_balancer_name" { # 
  description = "ALB Name"
  type        = string
}

variable "target_group_name" { # 
  description = "ALB Target Group Name"
  type        = string
}

variable "demo_app_service_name" { # 
  description = "ECS Service Name"
  type        = string
}

variable "code_pipeline_role_name" { # 
  description = "Role name for codepipeline"
  type        = string
}

variable "code_pipeline_policy_name" { # 
  description = "Policy name for codepipeline"
  type        = string
}

variable "code_pipeline_policy_desc" { # 
  description = "Policy description for codepipeline"
  type        = string
}

variable "bucket_pipeline_name" { # 
  description = "Name bucket for storing builds"
  type        = string
}

variable "pipeline_name" { # 
  description = "Pipeline name"
  type        = string
}

variable "file_name_building" { # 
  description = "Definition of image docker"
  type        = string
}
