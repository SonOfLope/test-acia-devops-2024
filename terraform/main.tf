resource "random_string" "rg" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "default" {
  name      = "${var.name}-${var.environment}-${random_string.rg.result}-rg"
  location  = var.resource_group_location
  tags      = var.azure_tags
}