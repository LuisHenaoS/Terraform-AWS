## Terraform y AWS

El ejercicio consiste en crear una infraestructura básica en AWS utilizando Terraform. A continuación, se describe paso a paso lo que debes configurar:

**Requisitos** 
- Estar logeado con aws credentials y tener configurado una clave par.
-  Tener instalado Terraform

### **Ejecución**

Configuramos terraform

Usa ```terraform init```

Luego ```terraform plan -var="YOUR_PUBLIC_IP=0.0.0.0"``` (Pon tu ip pública)

Y aplica de la misma forma ```terraform apply -var="YOUR_PUBLIC_IP=46.6.46.94"```

Al final de la instalación te dara la direccion http del load balancer para que ejecutes el curl de test **Ej:** ```curl -I http://app-load-balancer-1665673588.us-east-1.elb.amazonaws.com:8080```


Si la imagen AMI falla usa otra que generes usando ```aws ec2 describe-images \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
  --query 'Images[*].{ID:ImageId,Name:Name}' \
  --output table``` Y cambialo en el archivo ec2_instace.tf


