provider "aws" {
  region = "us-east-1"
}

#Step9: Create ec2 Instance
resource "aws_instance" "terraform" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "TF_key"
  subnet_id              = aws_subnet.publicsubnet.id
  vpc_security_group_ids = [aws_security_group.newSG.id]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("tfkey.pem")
    host        = self.public_ip
  }

  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y", # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }

  tags = {
    Name = "Terraform"
  }
}

# Print public Ip value
output "public_ip" {
  value = aws_instance.terraform.public_ip
}
