
output "appid" {
  value = azuread_application.app.application_id
}
output "password" {
  value     = azuread_service_principal_password.app.value
  sensitive = true
}
output "password_id" {
  value = azuread_service_principal_password.app.id
}

output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}
output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
