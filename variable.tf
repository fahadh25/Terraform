#Regions in list type
variable "aws_regions" {
  type = list(string)
  description = "AWS regions to use for deployment"
  default = ["ap-southeast-1","ap-south-1","us-east-1"]
}

#Instance size in map type
variable "aws_instance_size" {
    type = map(string)
    description = "AWS EC2 size"
    default = {
      "nano" = "t3a.nano"
      "micro"  = "t3a.micro"
    }
}
