provider "aws" {
	region = var.region
	access_key = var.my_access_key
	secret_key = var.my_secret_key
}

resource "aws_instance" "Demo1" {
	ami = "ami-0b0dcb5067f052a63"
	instance_type = "t2.micro"

user_data = <<-EOF
	        #!/bin/bash
		    sudo yum update -y
		    sudo yum -y install httpd -y
		    sudo service httpd start
			sudo yum install docker -y
            sudo systemctl start docker
            sudo systemctl enable docker
			sudo docker pull httpd:alpine3.16
			sudo docker run -it -d -p 8080:80 --name=apache httpd
		    echo "Hello world from EC2 $(hostname -f)" > /var/www/html/index.html
		    EOF
			
	tags = {
		Name = "Demo1"
	}
		vpc_security_group_ids = [aws_security_group.Demo1.id]
}

resource "aws_security_group" "Demo1" {
	name = "By Terraform"
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
 	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
