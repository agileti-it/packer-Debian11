terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
      #
      # For more information, see the provider source documentation:
      # https://github.com/josenk/terraform-provider-esxi
      # https://registry.terraform.io/providers/josenk/esxi
    }
  }
}

provider "esxi" {
	esxi_hostname	= "10.1.1.183"
	esxi_hostport	= "22"
	esxi_hostssl	= "443"
	esxi_username	= "root"
	esxi_password	= "1o2p3i4Z"
}

resource "esxi_guest" "vmtest" {
	guest_name	= "vmtest"
	guestos		= "debian1064"
	disk_store	= "datastore1"
	memsize		= "4096"
	numvcpus	= "4"
	boot_disk_size	= "17"

	clone_from_vm	= "debian-11-amd64"

	network_interfaces {
    		virtual_network = "VM Network"
  	}
}
