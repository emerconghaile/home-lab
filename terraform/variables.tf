# global
variable "home_lab_password" {
  description = "Global home lab password"
  type        = string
  sensitive   = true
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
