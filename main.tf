variable "type" {
  type = string
}
//creating the windows system
resource "aws_instance" "windows" {
        ami = "ami-04f33832b669e4355"
        instance_type = "t2.micro"
        tags =  {
          Name = "Ec2_Instance_Terraform"
        }
}

// create a security group for rdp access to the windows systems
resource "aws_security_group" "windows-sg" {
description = "Allow RDP inbound traffic"
 
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  // allow access to the internet
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//Security group attachment
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.windows-sg.id
  network_interface_id = aws_instance.windows.primary_network_interface_id
}

