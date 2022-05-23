provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "Shaiwal-test-aws" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.micro"
  key_name = "shaiwal-test-keypair-1"

  tags = {
    Name = "Shaiwal-devops-server-v1"
    env = "production"
    owner = "Shaiwal"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

