resource "azurerm_role_assignment" "acrpull_role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.jolopezcluster.kubelet_identity[0].object_id
  depends_on = [azurerm_kubernetes_cluster.jolopezcluster]
}

resource "azurerm_role_assignment" "acrpush_role" {
  principal_id            = "bb78d222-8e69-4abf-a682-9e906e33ded4"
  role_definition_name    = "AcrPush"  
  scope                   = azurerm_container_registry.acr.id
}

resource "azurerm_role_assignment" "contributor_role" {
  principal_id         = "bb78d222-8e69-4abf-a682-9e906e33ded4"
  role_definition_name = "Contributor"
  scope                = "/subscriptions/7e349100-77f0-4750-9bff-354325c60926"
}