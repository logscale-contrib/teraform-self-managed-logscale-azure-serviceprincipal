
output "appid" {
    value = azuread_application.app.id
}
output "password" {
    value = azuread_service_principal_password.app.value
    sensitive = true
}
output "password_id" {
    value = azuread_service_principal_password.app.id
}