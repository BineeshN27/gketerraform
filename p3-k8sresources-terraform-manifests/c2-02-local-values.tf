locals {
  owners       = var.business_division
  environement = var.environement
  name         = "${var.business_division}-${var.environement}"
  common_tags = {
    owners       = local.owners
    environement = local.environement
  }
}