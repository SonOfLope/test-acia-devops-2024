
resource "azurerm_kubernetes_cluster" "jolopezcluster" {
  location                          = azurerm_resource_group.default.location
  name                              = var.cluster_name
  resource_group_name               = azurerm_resource_group.default.name
  dns_prefix                        = var.dns_prefix
  http_application_routing_enabled  = true
  tags                              = var.azure_tags

  default_node_pool {
  name              = "agentpool"
    vm_size         = "Standard_B2s"
    node_count      = var.agent_count
    vnet_subnet_id  = azurerm_subnet.aks.id
  }
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  network_profile {
    network_plugin        = "azure"
  }
  
  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.default.id
  }
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.jolopezcluster]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.jolopezcluster.kube_config_raw
}
