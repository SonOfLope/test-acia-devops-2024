resource "azurerm_role_assignment" "acrpull_role" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.jolopezcluster.kubelet_identity[0].object_id
  depends_on = [azurerm_kubernetes_cluster.jolopezcluster]
}