resource "azurerm_subnet" "test" {
  name                 = var.name.subnet
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = [var.test.cidr]
}
