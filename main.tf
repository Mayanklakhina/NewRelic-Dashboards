resource "newrelic_one_dashboard" "mayank09231" {
  name        = "New Relic Terraform Dashboard"
  permissions = "public_read_only"

  page {
    name = "New Relic Terraform Dashboard"

    widget_billboard {
      title  = "Requests per minute"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = var.acc_id
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    } 
     widget_line {
      title  = "Average transaction duration and the request per minute, by application"
      row    = 4
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = var.acc_id
        query      = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
  }
   widget_bar {
      title  = "Average transaction duration, by application"
      row    = 2
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = var.acc_id
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }
      # Must be another dashboard GUID
      filter_current_dashboard = true

      # color customization
      colors {
        color = "#722727"
        series_overrides {
          color = "#722322"
          series_name = "Node"
        }
        series_overrides {
          color = "#236f70"
          series_name = "Java"
        }
      }
   }

  }
}