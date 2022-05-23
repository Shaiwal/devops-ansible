provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "Shaiwal-test-aws" {
  ami = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name = "shaiwal-key"

  tags = {
    Name = "Shaiwal-devops-server-v1"
    env = "production"
    owner = "Shaiwal"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

