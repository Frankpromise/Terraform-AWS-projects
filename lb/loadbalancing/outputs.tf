#----loadbalncing/output---

output "lb_target_group_arn" {
  value = aws_lb_target_group.mtc_tg.arn
}

output "lb_endpoint" {
  value = aws_lb.mtc_lb.dns_name
}

output "lb_listener" {
  value = aws_lb_listener.mtc_lb_listener.id
}