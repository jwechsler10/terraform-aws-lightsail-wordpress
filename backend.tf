terraform {
  backend "s3" {
    bucket = "jmw-tf-state"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-2"
    encrypt = true 
    dynamodb_table = "tf-state"
  }
}