resource "aws_instance" "server1" {
    instance_type = "t2.micro"
    user_data = file("setup.sh")
  
}