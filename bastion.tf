resource "aws_security_group" "bastion_security_group" {
    name = "bastion_security_group"
    vpc_id = aws_vpc.main.id 
    ingress {
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = ["43.251.173.246/32"]
    }
    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "bastion" {
  ami           = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_1.id

  key_name = "eks2"

  vpc_security_group_ids = [
    aws_security_group.bastion_security_group.id
  ]

  tags = {
    Name = "bastion-host"
  }
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}
data "aws_instances" "asg_instances" {
  instance_tags = {
    "aws:autoscaling:groupName" = aws_autoscaling_group.app_asg.name
  }

  instance_state_names = ["running"]
}
output "private_instance_ips" {
  value = data.aws_instances.asg_instances.private_ips
}
