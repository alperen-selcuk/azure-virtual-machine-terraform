resource "azurerm_network_security_group" "test" {
  name                = var.name.nsg
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "test"
  }
}