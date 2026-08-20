variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "vm_type" {
  description = "Virtual CPU type"
  type        = string
  default     = "kvm64"
}

variable "vm_started" {
  description = "Start VM after creation"
  type        = bool
  default     = false
}

variable "vm_on_boot" {
  description = "Start VM automatically on Proxmox boot"
  type        = bool
  default     = false
}

variable "clone_vm_id" {
  description = "VM ID used as clone template"
  type        = number
  default     = 9002
}

variable "clone_full" {
  description = "Create a full clone"
  type        = bool
  default     = false
}

variable "vm_up_delay" {
  description = "Delay in seconds before starting the next VM"
  type        = number
  default     = 100
}