resource "azurerm_virtual_network" "test" {
  name                = var.name.vnet
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  address_space       = [var.cidr]

  tags = {
    environment = "test"
  }
}
