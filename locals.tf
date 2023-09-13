#Local metadata
locals {
  instance_prefix = "test"
  common_tags = {
    Name = "test-server"
    project = "terraform"
  }
}