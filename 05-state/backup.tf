terraform {
  backend "s3" {
    bucket = "tfstatebackupterraform"
    key    = "file/state"
    region = "us-east-1"
  }
}
