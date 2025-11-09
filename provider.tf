terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = "2db9b8c2-e291-4322-82a6-b9162d6e42e8"
}

# provider "azuredevops" {
#   # Optional: only used if var.create_azure_devops_project = true
#   org_service_url = var.azure_devops_org_service_url
#   personal_access_token = var.azure_devops_pat
# }
