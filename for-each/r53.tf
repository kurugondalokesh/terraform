# resource "aws_route53_record" "for-each" {
#     for_each = aws_instance.for-each
#     zone_id = var.zone_id
#     name = each.key == "frontend" ? var.domain : "${each.key}.${var.domain}"
#     type = "A"
#     ttl = 1
#     records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
#     allow_overwrite = true
# }


resource "aws_route53_record" "expense" {
    for_each = var.instances
    zone_id  = var.zone_id
    
    # Logic for domain name
    name     = each.key == "frontend" ? var.domain : "${each.key}.${var.domain}"
    type     = "A"
    ttl      = 1
    
    # FIXED: Using [each.key] instead of [count.index]
    records  = [each.key == "frontend" ? aws_instance.for-each[each.key].public_ip : aws_instance.for-each[each.key].private_ip]
    
    allow_overwrite = true
}
