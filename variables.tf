
variable "provider" {
    type = string
    default = "us_east_1" # <--- PROVIDER REGION
}

/*
variable "instance_id" {
  type = string
  default = "value"    # <--- ID OF THE INSTANCE
}
*/

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
  default = "key_web" # <--- KEY NAME
}
  
variable "ami" {
  type = string
  default = "value" # <--- AMI ID
}