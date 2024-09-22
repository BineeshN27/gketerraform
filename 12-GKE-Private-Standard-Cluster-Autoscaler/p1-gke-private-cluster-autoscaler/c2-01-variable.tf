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

variable "subnet_ip_range" {
  description = "subnet IP range"
  type        = string
  default     = "10.29.0.0/20"
}

variable "k8s_pods_ip_range" {
  type    = string
  default = "10.11.0.0/21"
}

variable "k8s_service_ip_range" {
  type    = string
  default = "10.12.0.0./21"
}

variable "k8s_master_ip_range" {
  type    = string
  default = "10.13.0.0/28"
}