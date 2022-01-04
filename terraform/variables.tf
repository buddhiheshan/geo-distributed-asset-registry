variable "credentials_file" { type = string }
variable "project" { type = string }
variable "region" { type = string }
variable "zone" { type = string }

variable "user" { type = string }
variable "ssh_pub_key" { type = string }

variable "webapp_vpc" { type = string }

variable "private_subnet_asia_cidr" { type = string }
variable "private_subnet_asia_region" { type = string }
variable "asia_zones" { type = list(string) }
variable "master_ips_asia" { type = list(string) }
variable "worker_ips_asia" { type = list(string) }

variable "private_subnet_usa_cidr" { type = string }
variable "private_subnet_usa_region" { type = string }
variable "usa_zones" { type = list(string) }
variable "master_ips_usa" { type = list(string) }
variable "worker_ips_usa" { type = list(string) }