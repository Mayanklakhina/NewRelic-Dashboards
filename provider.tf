terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.26.0"
    }
  }
}
provider "newrelic" {
  account_id = 4043702
  api_key = "NRAK-GOQU1AWJ9YOJ1B7T97BQQ8YD736"  # Usually prefixed with 'NRAK'
  region = "US"  
}