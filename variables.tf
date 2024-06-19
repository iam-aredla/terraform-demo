<<<<<<< HEAD
variable "ami" {
  description = "value of ami"
  default     = "ami-04b70fa74e45c3917"
=======
variable "ami_value" {
  description = "value of ami"
  type        = list(string)
>>>>>>> a85ed8e (commit)
}

variable "instance_type" {
  description = "value of instance type"
<<<<<<< HEAD
  default     = "t2.micro"
}
=======
  type        = list(string)
}
>>>>>>> a85ed8e (commit)
