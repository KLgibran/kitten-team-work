# kitten-team-work

## AWS Fatura Alarmları

Bu Terraform konfigürasyonu, AWS hesabınızdaki tahmini maliyetler belirli eşikleri aştığında e-posta bildirimi gönderen CloudWatch alarmları oluşturur.

### Oluşturulan Kaynaklar

- **SNS Topic**: Alarm bildirimlerini iletmek için
- **SNS Subscription**: Bildirim e-postası için e-posta aboneliği
- **CloudWatch Alarm (1000 USD)**: Tahmini maliyet 1000 USD'yi aştığında tetiklenir
- **CloudWatch Alarm (2000 USD)**: Tahmini maliyet 2000 USD'yi aştığında tetiklenir
- **CloudWatch Alarm (3000 USD)**: Tahmini maliyet 3000 USD'yi aştığında tetiklenir

### Kullanım

1. AWS hesabınızda **Billing Alerts** özelliğini etkinleştirin:
   - AWS Console → Billing → Billing Preferences → Receive Billing Alerts

2. Terraform değişkenlerini ayarlayın:

```hcl
# terraform.tfvars
alarm_email = "your-email@example.com"
```

3. Terraform komutlarını çalıştırın:

```bash
terraform init
terraform plan
terraform apply
```

4. E-posta adresinize gelen **SNS abonelik onay e-postasını** onaylayın.

> **Not:** Billing metrikleri yalnızca `us-east-1` bölgesinde mevcuttur. Provider bölgesi bu yüzden `us-east-1` olarak ayarlanmıştır.
