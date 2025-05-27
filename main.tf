provider "aws" {
  region = var.aws_regions[0]
  access_key = "AWS Access Key"   #put access key or use environment variable
  secret_key = "AWS Secret Key"   #put access key or use environment variable
}

data "aws_security_group" "test-sg" {
    id = "sg-123456789"           #an existing security or create a new SG 
}

resource "aws_instance" "test-webserver" {
    ami = "ami-0464f90f5928bccb8"
    instance_type = var.aws_instance_size.nano
    key_name = "SSH Key pair name"    #SSH key name 
    vpc_security_group_ids = [data.aws_security_group.test-sg.id]
    tags = local.common_tags
    user_data_replace_on_change = true
    user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
EOF

}