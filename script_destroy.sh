#!/bin/bash
# Destruimos el fichero con las llaves creadas
rm llaves.txt

for i in {1..1}
do
  # Destruimos las máquinas que hemos creado
  terraform destroy -var=AWS_PUBLIC_KEY="claves-terraform-$i.pub" -auto-approve
done

for i in {1..1}
do
  # Destruimos las llaves de la maquina que acabamos de destruir
  rm "claves-terraform-$i.pub"
  rm "claves-terraform-$i"
done

# Destruimos isntance.tf para crear uno nuevo, para poder ejecutar el script_2 sin problemas
rm instance.tf

echo >> instance.tf

echo '
data "aws_ami" "Ubuntu_latest" {

  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22*"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
 '>> instance.tf