resource "azurerm_resource_group" "docker" {
  name     = var.rg-name
  location = var.region
}

resource "tls_private_key" "ssh-key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "ssh-key" {
  content         = tls_private_key.ssh-key.private_key_pem
  filename        = "ssh.pem"
  file_permission = "0600"
}
