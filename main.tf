variable "type" {
  type = string
}

//creating the windows system
resource "aws_instance" "windows" {
<<<<<<< HEAD
        ami = "ami-04f33832b669e4355"
=======
        ami = "ami-0afcbc82a6a511e53"
>>>>>>> 4321777b3c89f7127a15b5244c40b49181e3f8bd
        instance_type = "t2.micro"
        tags =  {
          Name = random_pet.name.id
        }
}

// create a security group for rdp access to the windows systems
resource "aws_security_group" "windows-sg" {
<<<<<<< HEAD
=======
name        = "${random_pet.name.id}-sg"
>>>>>>> 4321777b3c89f7127a15b5244c40b49181e3f8bd
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

<<<<<<< HEAD
//Security group attachment
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.windows-sg.id
  network_interface_id = aws_instance.windows.primary_network_interface_id
}
=======
>>>>>>> 4321777b3c89f7127a15b5244c40b49181e3f8bd
