terraform {
  backend "s3" {
    bucket = "olu-kops-auto-create"
    key    = "path/to/my/key"
    region = "eu-west-1"
  }
}
