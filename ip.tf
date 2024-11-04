resource "azurerm_public_ip" "test" {
  name                = var.name.public
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  allocation_method   = "Static"
  sku = "Standard"

  tags = {
    environment = "test"
  }
}

resource "azurerm_network_interface" "test" {
  name                = var.name.nic
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name


  ip_configuration {
    name                          = var.name.ip
    subnet_id                     = azurerm_subnet.test.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.test.id
  }
}

