provider "null" {}

provider "local" {}

provider "template" {}

resource "null_resource" "update_upgrade" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "pi"
      private_key = file(var.private_key_path)
      host        = var.hosts
    }
    inline = [
      "sudo apt update && sudo apt upgrade -y"
    ]
  }
}