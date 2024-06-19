# Creating multiple instances in multiple regions
resource "aws_instance" "ec2" {
    count = length(var.instance_type)
    provider = aws.us-east-1
    ami = element(var.ami_value, 0)
    instance_type = element(var.instance_type, count.index)

    tags = {
      Name = "Instance-${element(var.instance_type, count.index)}"
    }
}

resource "aws_instance" "ec2" {
    count = length(var.instance_type)
    provider = aws.us-west-1
    ami = element(var.ami_value, 1)
    instance_type = element(var.instance_type, count.index)

    tags = {
      Name = "Instance-${element(var.instance_type, count.index)}"
    }
}