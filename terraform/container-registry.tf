resource "azurerm_container_registry" "acr" {
  name                          = "jolopezContainerRegistry"
  resource_group_name           = azurerm_resource_group.default.name
  location                      = azurerm_resource_group.default.location
  sku                           = "Basic"
  tags                          = var.azure_tags
  admin_enabled                 = false
  public_network_access_enabled = true
}