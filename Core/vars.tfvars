root_id   = "atealab"
root_name = "Atea Lab - TC24"

connectivity_subscription_id = "b7405f29-bda8-4f5f-b7c9-93417d664b74"
management_subscription_id   = "c6f5d8fe-3185-45f8-ad61-12ae4709dee4"
identity_subscription_id     = "4785f71f-f202-4115-8ac8-2ab93d43d75d"

deploy_connectivity_resources      = true
deploy_ne_hub                      = true
connectivity_ne_resources_location = "norwayeast"
connectivity_ne_address_space      = ["10.255.0.0/16"]

connectivity_ne_vpngw_enabled       = true
connectivity_ne_vpngw_address_space = "10.255.0.0/24"



connectivity_resources_tags = {
  "Deployed-By" = "Terraform"
}