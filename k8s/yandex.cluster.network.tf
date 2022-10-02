
#### VPC ######
##-->
resource "yandex_vpc_network" "cluster-vpc" {
  name = "vpc.${var.cluster_name}"
}

#### SUBNETS ######
##-->
resource "yandex_vpc_subnet" "master-subnets" {
  v4_cidr_blocks  = [var.availability_zones[var.master-configs.zone]]
  zone            = var.master-configs.zone
  network_id      = yandex_vpc_network.cluster-vpc.id
  name            = "vpc-${var.master-configs.zone}-${var.cluster_name}" 
}
