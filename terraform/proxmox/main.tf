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
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  memory {
    dedicated = 2200
  }

  cpu {
    cores = 2
    type  = var.vm_type
  }

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 20
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.93/24"
        gateway = "192.168.0.1"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "kube_control_02" {
  name      = "kube-control-02"
  node_name = "proxmon"
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  memory {
    dedicated = 2200
  }

  cpu {
    cores = 2
    type  = var.vm_type
  }

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 20
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.94/24"
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
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  memory {
    dedicated = 2200
  }

  cpu {
    cores = 2
    type  = var.vm_type
  }

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 20
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
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

  depends_on = [
    proxmox_virtual_environment_vm.kube_control_02
  ]
}

resource "proxmox_virtual_environment_vm" "kube_worker_01" {
  name      = "kube-worker-01"
  node_name = "proxmon"
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  memory {
    dedicated = 1200
  }

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 15
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
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
    proxmox_virtual_environment_vm.kube_control_03
  ]
}

resource "proxmox_virtual_environment_vm" "kube_worker_02" {
  name      = "kube-worker-02"
  node_name = "proxmon"
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  memory {
    dedicated = 1200
  }

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 15
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
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
    proxmox_virtual_environment_vm.kube_worker_01
  ]
}

resource "proxmox_virtual_environment_vm" "load_balancer_01" {
  name      = "load-balancer-01"
  node_name = "proxmon"
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 5
  }

  memory {
    dedicated = 500
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.98/24"
        gateway = "192.168.0.1"
      }
    }
  }

  depends_on = [
    proxmox_virtual_environment_vm.kube_control_03
  ]
}

resource "proxmox_virtual_environment_vm" "load_balancer_02" {
  name      = "load-balancer-02"
  node_name = "proxmon"
  started   = var.vm_started
  on_boot   = var.vm_on_boot

  disk {
    interface    = "scsi1"
    datastore_id = "local-lvm"
    size         = 5
  }

  memory {
    dedicated = 500
  }

  clone {
    vm_id = var.clone_vm_id
    full  = var.clone_full
  }

  initialization {
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = "192.168.0.99/24"
        gateway = "192.168.0.1"
      }
    }
  }

  depends_on = [
    proxmox_virtual_environment_vm.load_balancer_01
  ]
}