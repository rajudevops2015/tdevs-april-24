variable "instance_type" {
  default = "t2.micro"

}

variable "istest" {}


variable "ec2list" {
  type    = list(any)
  default = ["m5.small", "m5.large", "t2.large"]
}

variable "ec2map" {
  type = map(any)
  default = {
    us-east-1  = "t2.nano"
    us-west-1  = "t2.micro"
    us-south-1 = "t2.small"
  }
}

variable "username" {
  type    = list(any)
  default = ["raju", "ram", "teja"]
}