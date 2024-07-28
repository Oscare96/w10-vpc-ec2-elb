resource "aws_security_group" "sg-demo" {
    name = "alb-sg"
    vpc_id = aws_vpc.vp1.id
    description = "Allow ssh and httpd"
    
    
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  }
  depends_on = [ aws_vpc.vp1 ]
}

resource "aws_security_group" "sg-demo" {
    name = "web-sg"
    vpc_id = aws_vpc.vp1.id
    description = "Allow ssh and httpd"
    
    
    ingress {
        description = "allow http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        //cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.sg-demo.name]
    }
    
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  tags= {
    env = "Dev"
  }
  depends_on = [ aws_vpc.vp1,  ]
}