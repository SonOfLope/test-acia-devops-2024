resource "azurerm_log_analytics_workspace" "default" {
  name                = "${var.name}-${var.environment}-law"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "default" {
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.default.location
  resource_group_name   = azurerm_resource_group.default.name
  workspace_name        = azurerm_log_analytics_workspace.default.name
  workspace_resource_id = azurerm_log_analytics_workspace.default.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}
