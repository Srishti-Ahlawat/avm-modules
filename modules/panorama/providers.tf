terraform {
  required_version = ">= 1.5, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = "05a4028e-14a9-4f7d-baf3-2629d5a430bc"
}
