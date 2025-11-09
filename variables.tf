
# ───────────────────────────────────────────────
# Resource Group
# ───────────────────────────────────────────────

variable "create_rg" {
  description = "Set to true to create a new Resource Group, false to use an existing one."
  type        = bool
  default = false
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to use or create."
  type        = string
  default     = "rg001"
}

variable "location" {
  description = "Azure region where resources will be deployed. Example: eastus, centralindia."
  type        = string
  default     = "eastus"
}


# ───────────────────────────────────────────────
# App Service Plan
# ───────────────────────────────────────────────

variable "app_service_plan_name" {
  description = "The name of the Azure App Service Plan."
  type        = string
  default = "asp01"
}

variable "app_service_plan_tier" {
  description = "Pricing tier for the App Service Plan (e.g., Free, Basic, Standard, Premium)."
  type        = string
  default     = "Free"
}

variable "app_service_plan_size" {
  description = "The instance size for the App Service Plan (e.g., F1, B1, S1, P1v2)."
  type        = string
  default     = "F1"
}


# ───────────────────────────────────────────────
# Web App
# # ───────────────────────────────────────────────

variable "app_name" {
  description = "The name of the Azure Web App to deploy."
  type        = string
  default = "webtempapp01"
}


# ───────────────────────────────────────────────
# Database
# # ───────────────────────────────────────────────

variable "db_admin_username" {
  description = "Admin username for Azure SQL Server"
  type        = string
  default     = "sqladminuser"
}

variable "db_admin_password" {
  description = "Admin password for Azure SQL Server"
  type        = string
  sensitive   = true
  default = "rishita03"
}


# ───────────────────────────────────────────────
# Tags
# ───────────────────────────────────────────────

variable "created_by" {
  description = "Tag used to identify the resource owner or creator."
  type        = string
  default     = "Rishita"
}
