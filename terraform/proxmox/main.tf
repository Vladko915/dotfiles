terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.111.1"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.0.90:8006/"
  api_token = var.proxmox_api_token
}

resource "proxmox_virtual_environment_vm" "kube_control_01" {
  name      = "kube-control-01"
  node_name = "proxmon"

  started = false

  clone {
    vm_id = 101
    full  = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.0.95/24"
        gateway = "192.168.0.1"
      }
    }
  }
}