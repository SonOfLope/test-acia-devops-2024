resource "azurerm_virtual_network" "virtual_network" {
  name =  "aks-vnet"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "aks" {
  name                      = "snet-aks"
  resource_group_name       = azurerm_resource_group.default.name
  virtual_network_name      = azurerm_virtual_network.virtual_network.name
  address_prefixes          = ["192.168.0.0/24"]
}