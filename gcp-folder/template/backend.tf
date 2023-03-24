#.................................... Terraform Backend ....................................#

 terraform {
    backend "gcs" {
    bucket  = "buck-tfe-gcp-kitchen"
    prefix  = "gcp-folder/"
  }
} 