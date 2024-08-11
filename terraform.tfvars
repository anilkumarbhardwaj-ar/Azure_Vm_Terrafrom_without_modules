anil = {
  pip1 = {
    name = "pip-admin1"

  }
  pip2 = {
    name = "pip-admin2"

  }
}

subnet = {
  sub1 = {
    name             = "arati-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  sub2 = {
    name             = "jagdamba-subnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}


nic = {

  nic1 = {
    name = "arati-nic"
    ip_configuration = {

      subnet_id = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/virtualNetworks/anil-vnet1/subnets/arati-subnet"

      public_ip_address_id = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/publicIPAddresses/pip-admin1"
    }
  }

  nic2 = {
    name = "jagdamba-nic"
    ip_configuration = {

      subnet_id = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/virtualNetworks/anil-vnet1/subnets/jagdamba-subnet"

      public_ip_address_id = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/publicIPAddresses/pip-admin2"
    }
  }
}


winvm = {

  vm1 = {
name = "frontend"
network_interface_ids = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/networkInterfaces/arati-nic"

  }

  vm2 = {
name = "backend"
network_interface_ids = "/subscriptions/c161254a-03fa-4c91-884d-579d7bb02998/resourceGroups/rg-admin/providers/Microsoft.Network/networkInterfaces/jagdamba-nic"

  }
}
