variable "type" {
  type = string
}

//creating the windows system
resource "aws_instance" "windows" {
        ami = "ami-0afcbc82a6a511e53"
        instance_type = "t2.micro"
        tags =  {
          Name = aws_instance.windows.id
        }
}

// create a security group for rdp access to the windows systems
resource "aws_security_group" "windows-sg" {
name        = "${aws_instance.windows.id}-sg"
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

