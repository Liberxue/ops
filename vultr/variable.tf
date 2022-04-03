# Configure the Vultr Provider
provider "vultr" {
  #export VULTR_API_KEY="Your Vultr API Key"
  rate_limit  = 700
  retry_limit = 3
}

variable "strapi_hostname" {
  type        = string
  description = "The hostname of the strapi instance"
  default     = "SSR"
}

variable "strapi_label" {
  type        = string
  description = "The label assigned to the strapi instance"
  default     = "my-strapi-srv"
}


variable "vultr_region" {
  description = "Asia Tokyo"
  default     = "nrt" #curl "https://api.vultr.com/v2/regions"  -X GET "Authorization: Bearer ${VULTR_API_KEY}"
}

variable "docker_centos" {
  description = "Docker on CentOS 7" # curl "https://api.vultr.com/v2/os"   -X GET   -H "Authorization: Bearer ${VULTR_API_KEY}"
  default     = 17
}

variable "instance_os" {
  type        = string
  description = "The Operating system installed on the servers."
  default     = 167
}

variable "one_cpu_one_gb_ram" {
  description = "1024 MB RAM,25 GB SSD,1.00 TB BW"
  default     = "vc2-1c-1gb"
}


