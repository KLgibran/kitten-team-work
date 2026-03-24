provider "aws" {
  region = "us-east-1" # Billing metrics are only available in us-east-1
}

resource "aws_sns_topic" "billing_alarm_topic" {
  name = "billing-alarm-topic"
}

resource "aws_sns_topic_subscription" "billing_alarm_email" {
  topic_arn = aws_sns_topic.billing_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm" {
  for_each = toset([for t in var.billing_thresholds : tostring(t)])

  alarm_name          = "billing-alarm-${each.key}usd"
  alarm_description   = "AWS hesabı tahmini maliyeti ${each.key} USD eşiğini aştı"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 86400 # 24 hours
  statistic           = "Maximum"
  threshold           = tonumber(each.key)
  alarm_actions       = [aws_sns_topic.billing_alarm_topic.arn]
  ok_actions          = [aws_sns_topic.billing_alarm_topic.arn]

  dimensions = {
    Currency = "USD"
  }
}
