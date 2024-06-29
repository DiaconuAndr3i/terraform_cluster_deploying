variable "code_pipeline_role_name" {
  description = "Role name for codepipeline"
  type        = string
}

variable "code_pipeline_policy_name" {
  description = "Policy name for codepipeline"
  type        = string
}

variable "code_pipeline_policy_desc" {
  description = "Policy description for codepipeline"
  type        = string
}

variable "bucket_pipeline_name" {
  description = "Name bucket for storing builds"
  type        = string
}

variable "pipeline_name" {
  description = "Pipeline name"
  type        = string
}

variable "repository_codecommit_name" {
  description = "code commit repo name"
  type        = string
}

variable "cluster_name" {
  description = "name of the cluster where the code is ran"
  type        = string
}

variable "service_name" {
  description = "name of the service which will run the code"
  type        = string
}

variable "file_name_building" {
  description = "Definition of image docker"
  type        = string
}

variable "codebuild_project_name" {
  description = "Definition of image docker"
  type        = string
}