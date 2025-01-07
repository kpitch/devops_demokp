variable "hosts" {
  description = "List of Raspberry Pi host IPs or hostnames"
  type        = list(string)
  
}

variable "ssh_user" {
  description = "SSH username for the Raspberry Pi devices"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file for SSH"
  type        = string
}
