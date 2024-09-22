# GCP Project
variable "gcp_project" {
  description = "project name"
  type        = string
  default     = "gke-learning-101984"
}

#GCP Region
variable "gcp_region" {
  description = "gcp region"
  type        = string
  default     = "us-east1"
}

# GCP Compute Engine Mahcine Type
variable "machine_type" {
  description = "Machine Type"
  type        = string
  default     = "e2-small"
}

# Enviroenement
variable "environement" {
  description = "Environement variable as prefix"
  type        = string
  default     = "dev"
}

# Business Divions
variable "business_division" {
  description = "Business Division"
  type        = string
  default     = "sap"
}