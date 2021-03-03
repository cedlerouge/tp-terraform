terraform {
    required_version = ">= 0.14.0"
    required_providers {
        openstack = {
            source = "terraform-provider-openstack/openstack"
            version = "~> 1.35.0"
        }
    }
}

provider openstack {
#    region = "regionOne"
}
resource "openstack_compute_instance_v2" "standalone-server" {
  name              = "std_server-2"
  image_name        = "ubuntu_18_current"
  flavor_name       = "m1.small"
  key_pair          = "ced_rsa"
  security_groups   = ["default"]

  metadata = {
      this = "that"
  }

  network {
      name = "common"
  }
}
