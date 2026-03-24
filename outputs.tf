output "sns_topic_arn" {
  description = "Fatura alarm bildirimleri için SNS topic ARN'ı"
  value       = aws_sns_topic.billing_alarm_topic.arn
}

output "billing_alarm_arns" {
  description = "Oluşturulan CloudWatch alarm ARN'larının eşik değerlerine göre haritası"
  value       = { for k, v in aws_cloudwatch_metric_alarm.billing_alarm : k => v.arn }
}
