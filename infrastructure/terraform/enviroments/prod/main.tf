module "resourceg" {
  source = "../../modules/resourcegroups"
  rgs    = var.rgs
}



module "virtual_network" {
  depends_on = [module.resourceg]
  source     = "../../modules/Vnets"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.virtual_network, module.network_security_groups]
  source     = "../../modules/subnets"
  subnets    = var.subnets
}

module "nics" {
  depends_on = [module.subnets]
  source     = "../../modules/Nics"
  nics       = var.nics
}

module "vms" {
  depends_on = [module.nics]
  source     = "../../modules/compute"
  vms        = var.vms
  # keyvault = var.keyvaultsecret
}


module "pips" {
  depends_on = [module.resourceg]
  source     = "../../modules/PIPs"
  pips       = var.pips

}

module "network_security_groups" {
  depends_on = [module.resourceg]
  source     = "../../modules/nsg"
  nsgs       = var.nsgs
}