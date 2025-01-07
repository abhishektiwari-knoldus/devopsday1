variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair"
  default = "key.pem"
}

variable "ami_id" {
  default = "ami-053b12d3152c0cc71" # Amazon Linux 2 AMI (update to match your region)
}