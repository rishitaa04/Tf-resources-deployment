##########################################
# Conditional Resource Group Logic
##########################################

# Use existing RG if not creating a new one
# data "azurerm_resource_group" "existing_rg" {
#   count = var.create_rg ? 0 : 1
#   name  = var.resource_group_name
# }

# Create new RG if flag is true
resource "azurerm_resource_group" "new_rg" {
  # count    = var.create_rg ? 1 : 0
  name     = var.resource_group_name
  location = var.location

  tags = {
    created_by = "Rishita"
  }
}

# Pick whichever RG exists
# locals {
#   rg_name     = var.create_rg ? azurerm_resource_group.new_rg[0].name : data.azurerm_resource_group.existing_rg[0].name
#   rg_location = var.create_rg ? azurerm_resource_group.new_rg[0].location : data.azurerm_resource_group.existing_rg[0].location
# }

# ##########################################
# # App Service Plan (Linux)
# ##########################################
resource "azurerm_app_service_plan" "asp" {
  name                = "asp01"
  location            = "centralindia"   # HardCoded - Location unavailable for asp unlike rg
  resource_group_name = var.resource_group_name

  kind     = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = {
    created_by = var.created_by
  }
}


# ##########################################
# # Application Insights
# ##########################################

resource "azurerm_application_insights" "app_insights" {
  name                = "appinsights-${var.app_name}"
  location            = azurerm_resource_group.new_rg.location
  resource_group_name = azurerm_resource_group.new_rg.name
  application_type    = "web"
}

# ##########################################
# # Linux Web App
# ##########################################
resource "azurerm_linux_web_app" "backend_app" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.new_rg.name
  location            = azurerm_app_service_plan.asp.location
  service_plan_id     = azurerm_app_service_plan.asp.id

  depends_on = [azurerm_app_service_plan.asp]

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}


###############################################
#  Azure App Registration
###############################################
resource "azuread_application" "frontend_app" {
  display_name     = "frontendapp"

  # Redirect URIs for frontend login
  web {
    redirect_uris = [
      "http://localhost:5173/"                 # Local React dev

    ]
  }
}
##########################################
# Azure SQL Server 
##########################################
resource "azurerm_mssql_server" "sql_server" {
  name                         = "templatesqlserver"
  resource_group_name          = azurerm_resource_group.new_rg.name
  location                     = "westus2"                      # FIXED: supported region coz rg location thew error
  version                      = "12.0"
  administrator_login          = "sqlserver01"
  administrator_login_password = "_Rishita@03"
  minimum_tls_version          = "1.2"

  tags = {
    created_by = var.created_by
  }
}

##########################################
# Azure SQL Database
##########################################
resource "azurerm_mssql_database" "sql_db" {
  name           = "sqldb-${var.app_name}"
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = "S0"
  max_size_gb    = 5
  zone_redundant = false

  tags = {
    created_by = var.created_by
  }
}