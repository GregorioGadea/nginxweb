
variable "region" {
    type = string
    default = "us-east-1" # <--- PROVIDER REGION
}

variable "instance_type" {
  type = string
  default = "t2.micro" # <--- INSTANCE TYPE
}

variable "availability_zone" {
  type = string
  default = "us-east-1a" # <--- AVAILABILITY ZONE
}

variable "aws_key" {
  type = string
  default = "./web/key/key_web" # <--- KEY NAME
}
  
variable "ami" {
  type = string
  default = "value" # <--- AMI ID
}
