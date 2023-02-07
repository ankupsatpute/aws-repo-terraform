terraform {
  backend "s3" {
    bucket = "ankushsatpute-mybucket"
    key    = "my-ec2-instance/statefile"
    region = "ap-south-1"

  }
}
