module "ecrRepo" {
  source        = "./modules/ecr"
  ecr_repo_name = var.ecr_repo_name
}

module "ecsCluster" {
  source = "./modules/ecs"

  demo_app_cluster_name = var.demo_app_cluster_name
  availability_zones    = var.availability_zones

  demo_app_task_famliy         = var.demo_app_task_famliy
  ecr_repo_url                 = module.ecrRepo.repository_url
  container_port               = var.container_port
  demo_app_task_name           = var.demo_app_task_name
  ecs_task_execution_role_name = var.ecs_task_execution_role_name

  application_load_balancer_name = var.application_load_balancer_name
  target_group_name              = var.target_group_name
  demo_app_service_name          = var.demo_app_service_name
}

module "codecommit" {
  source               = "./modules/codecommit"
  codecommit_repo_name = var.codecommit_repo_name
}

module "codebuild" {
  source = "./modules/codebuild"

  codebuild_role_name             = var.codebuild_role_name
  policy_for_codebuild            = var.policy_for_codebuild
  codebuild_project_name          = var.codebuild_project_name
  artifacts_type                  = var.artifacts_type
  env_compute_type                = var.env_compute_type
  env_image                       = var.env_image
  env_type                        = var.env_type
  env_image_pull_credentials_type = var.env_image_pull_credentials_type
  source_type                     = var.source_type
  source_location                 = module.codecommit.url_clone_pushing
  source_buildspec                = var.source_buildspec
}

module "codepipeline" {
  source = "./modules/codepipeline"

  code_pipeline_role_name    = var.code_pipeline_role_name
  code_pipeline_policy_name  = var.code_pipeline_policy_name
  code_pipeline_policy_desc  = var.code_pipeline_policy_desc
  bucket_pipeline_name       = var.bucket_pipeline_name
  pipeline_name              = var.pipeline_name
  repository_codecommit_name = var.codecommit_repo_name
  cluster_name               = var.demo_app_cluster_name
  service_name               = var.demo_app_service_name
  file_name_building         = var.file_name_building
}