resource "null_resource" "docker-compose" {

  triggers = {
    id = azurerm_linux_virtual_machine.test.id
  }

  connection {
    agent       = "false"
    type        = "ssh"
    user        = "test"
    private_key = tls_private_key.ssh-key.private_key_pem
    host        = azurerm_linux_virtual_machine.test.public_ip_address
  }

  provisioner "file" {
    source      = "./docker-compose.yml"            # Local path to Docker Compose file
    destination = "/home/test/docker-compose.yml"    # Path on the Azure VM
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sleep 90",
      "sudo chown test:test /var/run/docker.sock",
      "sudo chmod +x /home/test/docker-compose.yml",
      "docker compose up -d"
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.test]
}

