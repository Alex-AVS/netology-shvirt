variable "folder_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "token" {
  sensitive = true
  type = string
}

source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = var.folder_id
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = var.subnet_id
  token               = var.token
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
      "echo 'hello from packer'",
      "echo 'installing tools...'",
      "sudo apt update",
      "sudo apt -y install curl htop tmux",
      "echo 'installing docker...'",
      "curl -fsSL https://get.docker.com | sudo sh"
    ]
  }

}
