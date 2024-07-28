resource "aws_instance" "server1" {
    instance_type = "t2.micro"
    user_data = file("setup.sh")
    vpc_security_group_ids = [aws_security_group.sg-demo.id]
    subnet_id = aws_subnet.private1.id
    availability_zone = "us-east-1a"
    ami = "ami-03972092c42e8c0ca"
    tag= {
        Name
    }
  
}