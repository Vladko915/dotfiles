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
  started   = false

  clone {
    vm_id = 101
    full  = true
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.95/24"
        gateway = "192.168.0.1"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "kube_control_02" {
  name      = "kube-control-02"
  node_name = "proxmon"
  started   = false

  clone {
    vm_id = 101
    full  = true
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.96/24"
        gateway = "192.168.0.1"
      }
    }
  }

  depends_on = [
    proxmox_virtual_environment_vm.kube_control_01
  ]
}

resource "proxmox_virtual_environment_vm" "kube_control_03" {
  name      = "kube-control-03"
  node_name = "proxmon"
  started   = false

  clone {
    vm_id = 101
    full  = true
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.97/24"
        gateway = "192.168.0.1"
      }
    }
  }

  depends_on = [
    proxmox_virtual_environment_vm.kube_control_02
  ]
}