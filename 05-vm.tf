resource "azurerm_linux_virtual_machine" "test" {
  name                  = var.name.vm
  location              = azurerm_resource_group.test.location
  resource_group_name   = azurerm_resource_group.test.name
  network_interface_ids = [azurerm_network_interface.test.id]
  size                  = "Standard_B2ms"
  admin_username        = "docker"

  admin_ssh_key {
    username   = "docker"
    public_key = tls_private_key.ssh-key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  custom_data = base64encode(<<-EOF
    #cloud-config
    package_update: true
    package_upgrade: true
    runcmd:
      - curl https://raw.githubusercontent.com/alperen-selcuk/docker-install/refs/heads/main/ubuntu-2204.sh | bash -
  EOF
  )

  depends_on = [local_file.ssh-key]
}

