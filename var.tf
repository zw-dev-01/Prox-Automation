variable "proxmox_host" {
	type = map
     default = {
       pm_api_url = "https://192.168.1.10:8006/api2/json"
       pm_user = "root@pam"
       target_node = "LAB"
     }
}

variable "vmid" {
	default     = 4000
	description = "Starting ID for the CTs"
}


variable "hostnames" {
  description = "VMs to be created"
  type        = list(string)
  default     = ["prod-vm", "staging-vm", "dev-vm"]
}

variable "rootfs_size" {
	default = "2G"
}

variable "ips" {
    description = "IPs of the VMs, respective to the hostname order"
    type        = list(string)
	default     = ["192.168.1.51","192.168.1.52","192.168.1.53"]
}

variable "ssh_keys" {
	type = map
     default = {
       pub  = ".ssh/mydev.pub"
       priv = ".ssh/mydev"
     }
}

variable "ssh_password" {
}

variable "user" {
	default     ="ubuntu"
	description = "User used to SSH into the machine and provision it"
}
