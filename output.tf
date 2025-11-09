# # ───────────────────────────────────────────────
# # Resource Group
# # ───────────────────────────────────────────────

# output "resource_group_name" {
#   description = "The name of the Resource Group in use (either existing or newly created)."
#   value       = local.rg_name
# }

# output "resource_group_location" {
#   description = "The Azure region of the Resource Group."
#   value       = local.rg_location
# }


# # ───────────────────────────────────────────────
# # App Service Plan
# # ───────────────────────────────────────────────

# output "app_service_plan_id" {
#   description = "The ID of the Azure App Service Plan."
#   value       = azurerm_app_service_plan.asp.id
# }

# output "app_service_plan_name" {
#   description = "The name of the Azure App Service Plan."
#   value       = azurerm_app_service_plan.asp.name
# }


# # ───────────────────────────────────────────────
# # Web App
# # ───────────────────────────────────────────────

# # output "web_app_name" {
# #   description = "The name of the deployed Azure Web App."
# #   value       = azurerm_linux_web_app.web_app.name
# # }

# # output "web_app_url" {
# #   description = "The default hostname (URL) of the Azure Web App."
# #   value       = azurerm_linux_web_app.web_app.default_hostname
# # }

# # output "web_app_id" {
# #   description = "The ID of the Azure Web App."
# #   value       = azurerm_linux_web_app.web_app.id
# # }
