resource "aws_lb_target_group" "tg1" {
    name= "alb-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.vp1.id

    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 100
      matcher = 200
      path = "/"
      port = "traffic-port"
      protocol = "HTTP"
      timeout = 6
      unhealthy_threshold = 3 

    }
}

resource "aws_lb_target_group_attachment" "at1" {
    target_group_arn = aws_lb_target_group.tg1.arn
    target_id = aws_instance.server1.id
    port = 80
  
}

resource "aws_lb_target_group_attachment" "at2" {
    target_group_arn = aws_lb_target_group.tg1.arn
    target_id = aws_instance.server2.id
    port = 80
  
}

resource "" "name" {
  
}