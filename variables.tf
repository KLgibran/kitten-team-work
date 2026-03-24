variable "alarm_email" {
  description = "Fatura alarmları için bildirim e-posta adresi"
  type        = string
}

variable "billing_thresholds" {
  description = "CloudWatch fatura alarmı oluşturulacak USD eşik değerleri"
  type        = list(number)
  default     = [1000, 2000, 3000]
}
