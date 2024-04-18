root_id   = "atealab"
root_name = "Atea Lab - TC24"

connectivity_subscription_id = "b22f1141-d9ca-4eec-8c23-70c5376ee502"
management_subscription_id   = "68e1a086-c9d8-4f26-a421-9968e5fd7086"
identity_subscription_id     = "1ed18b83-7159-4fab-998b-25fb7000d0e5"

deploy_connectivity_resources      = true
deploy_ne_hub                      = true
connectivity_ne_resources_location = "norwayeast"
connectivity_ne_address_space      = ["10.255.0.0/16"]

connectivity_ne_vpngw_enabled       = true
connectivity_ne_vpngw_address_space = "10.255.0.0/24"



connectivity_resources_tags = {
  "Deployed-By" = "Terraform"
}