###cloud vars
variable "token" {
  type        = string
}

variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vpc_name" {
  type        = string
  default     = "swarm-net"
  description = "VPC network&subnet name"
}

###common VM vars

variable "vms_ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "Username for SSH access to VMs."
}

variable "docker_url" {
  type        = string
  default     = "https://get.docker.com"
  description = "docker install script URL"
}

variable "vms_common_options" {
  type = object({
    name = string
    preemptible = bool
    public_ip = bool
    net_nat = bool
    platform = string
    meta_serial-port-enable = number
    env_name       = string
    subnet_zones   = list(string)
    boot_disk_size = number
    image_family   = string
    cores = number
    cores_fraction = number
    memory = number

  })
  default = {
      name = "swarm"
      preemptible = true
      platform       = "standard-v1"
      env_name       = "swarm-net"
      subnet_zones   = ["ru-central1-a"]
      boot_disk_size = 5
      image_family   = "debian-12"
      public_ip      = true
      net_nat        = true
      meta_serial-port-enable = 1
      #resources
      cores = 2
      cores_fraction = 20
      memory = 1

  }
  description = "Parameters common to all VMs"
}

variable "vms_count" {
  type        = number
  default     = 3
  description = "No of VMs to create."
}

