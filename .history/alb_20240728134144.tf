resource "aws_lb_target_group" "tg1" {
    name= "alb-tg"
    port = 80
    protocol = "HTTP"
    V
  
}