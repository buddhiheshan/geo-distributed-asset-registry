credentials_file = "service_account_key.json"
project          = "geo-distributed-asset-registry"
region           = "asia-southeast1"
zone             = "asia-southeast1-a"

user        = "buddhi"
ssh_pub_key = "~/.ssh/id_ed25519.pub"

webapp_vpc = "webapp-vpc"

private_subnet_asia_cidr   = "10.0.0.0/24"
private_subnet_asia_region = "asia-southeast1"
asia_zones                 = ["asia-southeast1-a", "asia-southeast1-b", "asia-southeast1-c"]
master_ips_asia            = ["10.0.0.100", "10.0.0.101", "10.0.0.102"]
worker_ips_asia            = ["10.0.0.200", "10.0.0.201", "10.0.0.202"]

private_subnet_usa_cidr   = "10.0.1.0/24"
private_subnet_usa_region = "us-central1"
usa_zones                 = ["us-central1-a", "us-central1-b", "us-central1-c"]
master_ips_usa            = ["10.0.1.100", "10.0.1.101", "10.0.1.102"]
worker_ips_usa            = ["10.0.1.200", "10.0.1.201", "10.0.1.202"]