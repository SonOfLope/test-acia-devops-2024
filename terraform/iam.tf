resource "azurerm_role_assignment" "acrpull_role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.jolopezcluster.kubelet_identity[0].object_id
  depends_on = [azurerm_kubernetes_cluster.jolopezcluster]
<<<<<<< HEAD
=======
}

resource "azurerm_role_assignment" "acrpush_role" {
  principal_id            = "dcc8f324-b693-46b4-b11a-62cfe8cfaea3"
  role_definition_name    = "AcrPush"  
  scope                   = azurerm_container_registry.acr.id
}

resource "azurerm_role_assignment" "contributor_role" {
  principal_id         = "dcc8f324-b693-46b4-b11a-62cfe8cfaea3"
  role_definition_name = "Contributor"
  scope                = "/subscriptions/7e349100-77f0-4750-9bff-354325c60926"
>>>>>>> parent of e1f2450 (update sp object id)
}