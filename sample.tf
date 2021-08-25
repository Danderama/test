
resource "aws_instance" "web" {
    ami = "ami-0b0af3577fe5e3532"
	instance_type = "t2.micro" 
	security_groups = ["${aws_security_group.allow_sg.name}"]
	key_name = "${aws_key_pair.key_pair_generation.key_name}"
    
	
	provisioner "remote-exec" {
	  inline = [
	    "sudo yum update -y",
		"sudo yum install nginx -y",
		"sudo systemctl enable nginx",
		"sudo systemctl start nginx"
	  ]
	}
	connection {
	     host = self.public_ip
		 type = "ssh"
		 user = "ec2-user"
		 private_key =  file("C:/Users/RAMA/Downloads/Deveops.pem")
	 
	  }
	
}

resource "aws_key_pair" "key_pair_generation" {

    key_name = "rama_key"
	public_key = file("C:/Users/RAMA/Downloads/Deveops1.ppk")
}
resource "aws_security_group" "allow_sg" {
    name = "my-own-sg-all"
	ingress {
	  cidr_blocks = ["0.0.0.0/0"]
	  from_port = 22
	  to_port = 22 
	  protocol = "TCP"
 }
    ingress {
	  cidr_blocks = ["0.0.0.0/0"]
	  from_port = 80
	  to_port = 80
	  protocol = "TCP"
 }
	egress {
	cidr_blocks = ["0.0.0.0/0"]
	from_port = 0
	to_port = 0
	protocol = "-1"
 }
}
  