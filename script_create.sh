#!/bin/bash
#sh script_1.sh

terraform init
echo >> llaves.txt

for i in {1..1}
do
  # Crear una llave y ejecutar el terraform plan
  ssh-keygen -f claves-terraform-$i -N ""
  terraform plan -var=AWS_PUBLIC_KEY="claves-terraform-$i.pub"

  # Escribimos en instance.tf el recurso de la llave
  echo '
  resource "aws_key_pair" "clave-ssh-'$i'" {
    key_name = "terraform-ssh-'$i'"
    public_key = file(var.AWS_PUBLIC_KEY)
  }
  ' >> instance.tf

  # Escribimos en instance.tf el recurso de la instancia que vamos a levantar
  echo '
  #'$i'. Instantzia:
  resource "aws_instance" "mi-instancia-'$i'" {
    ami           = data.aws_ami.Ubuntu_latest.id
    instance_type = "t2.micro"


    key_name = aws_key_pair.clave-ssh-'$i'.key_name  

    vpc_security_group_ids = [aws_security_group.security_usuario.id]
    subnet_id = aws_subnet.subred-1.id

    tags = {
      name = "instancia_numero: '$i'"
    }
  }
  '>> instance.tf

  # Escribimos en instance.tf el output de la dirección IP de la instancia que vamos a levantar
  echo '
  output "public-ip-usuario-'$i'" {
    value = aws_instance.mi-instancia-'$i'.public_ip
  }
  '>> instance.tf

  # Guardamos tanto la llave privada como la pública, en el fichero llaves.txt 
  echo "
  La llave PRIVADA del usuario $i es el siguiente: 
  ">> llaves.txt

  cat claves-terraform-$i >> llaves.txt 

  echo "
  La llave PUBLICA del usuario $i es el siguiente: 
  ">> llaves.txt
  
  cat claves-terraform-$i.pub >> llaves.txt 

  echo " 
  ********************************************************************************************* 
  ">> llaves.txt

  # Levantamos la máquina con la llave que hemos creado
  terraform apply -var=AWS_PUBLIC_KEY="claves-terraform-$i.pub" -auto-approve
done

