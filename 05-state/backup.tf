terraform {
  backend "s3" {
    bucket = "tfstatebackupterraform"
    key    = "file/state.tfstate"
    region = "us-east-1"
  }
}
