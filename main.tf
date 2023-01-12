data "azuread_client_config" "current" {}

resource "azuread_application" "app" {
  display_name = var.name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "app" {
  application_id               = azuread_application.app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}


resource "time_rotating" "app" {
  rotation_years = 2
}

resource "azuread_service_principal_password" "app" {
  service_principal_id = azuread_service_principal.app.object_id
  rotate_when_changed = {
    rotation = time_rotating.app.id
  }
}


resource "azurerm_role_assignment" "main" {
  count                = length(var.assignments)
  name                 = var.azure_role_name
  description          = var.azure_role_description
  scope                = var.assignments[count.index].scope
  role_definition_name = var.assignments[count.index].role_definition_name
  principal_id         = azuread_service_principal.app.object_id
}
