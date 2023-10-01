# global
variable "home_lab_password" {
  description = "Global home lab password"
  type        = string
  sensitive   = true
}
variable "ssh_public_key" {
  description = "Global home lab SSH public key"
  type        = string
}
# Proxmox provider
variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}
variable "pm_user" {
  description = "Proxmox user"
  type        = string
}
