variable "name" {
  type        = string
  default     = "JolopezCloud"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique to the Azure subscription."
}

variable "environment" {
  type        = string
  description = "Name of the deployment environment"
  default     = "dev"
}

variable "resource_group_location" {
  default     = "canadaeast"
  description = "Location of the resource group."
}

variable "log_analytics_workspace_name" {
  default = "testLogAnalyticsWorkspaceName"
}

variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "agent_count" {
  default = 1
}

variable "cluster_name" {
  default = "jolopez-cluster"
}

variable "dns_prefix" {
  default = "jolopez"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa_jolopez.pub"
}

variable "azure_tags" {
  type = map(string)
  default = {
    Environment = "ACIA Test Cluster"
    Team = "DevOps"
    "Created by" = "Jonathan Lopez"
  }
}

variable "subscription_id" {
  default = ""
}

variable "principal_id" {
  default = ""
}