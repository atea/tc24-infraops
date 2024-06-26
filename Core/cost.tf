

resource "azurerm_consumption_budget_management_group" "example" {
  name                = "Lab-Budget"
  management_group_id = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id

  amount     = 200
  time_grain = "Monthly"

  time_period {
    start_date = "2024-04-01T00:00:00Z"
    end_date   = "2024-05-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = 90.0
    operator  = "EqualTo"

    contact_emails = [
      "fredrik.wikestad@atea.no",
      "fredrik.nyland.tessem@atea.no",
      "marius.weetman@atea.no"
    ]
  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = [
      "fredrik.wikestad@atea.no",
      "fredrik.nyland.tessem@atea.no",
      "marius.weetman@atea.no"
    ]
  }
}