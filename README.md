# Configuración de Terraform para Instancia EC2 en AWS

Este proyecto contiene el código de Terraform para configurar un entorno de AWS con una VPC, una subred pública, una puerta de enlace de internet, una tabla de rutas, un grupo de seguridad y una instancia EC2. Incluye variables para una fácil configuración y personalización.

## Prerrequisitos

- Terraform instalado en tu máquina local.
- AWS CLI configurado con credenciales de usuario IAM apropiadas.

## Estructura de Archivos

- `EC2.tf`: Contiene la configuración principal de Terraform para los recursos de AWS.
- `variables.tf`: Contiene las definiciones de variables utilizadas en la configuración de Terraform.
- `.gitignore`: Especifica los archivos y directorios que deben ser ignorados en el control de versiones.

## Variables

- `vpc_cidr`: El bloque CIDR de la VPC (por defecto: "10.0.0.0/16").
- `subnet_cidr`: El bloque CIDR de la subred (por defecto: "10.0.1.0/24").
- `availability_zone`: La zona de disponibilidad donde se creará la subred (por defecto: "us-east-1a").
- `all_traffic_cidr`: El bloque CIDR que permite todo el tráfico (por defecto: "0.0.0.0/0").
- `ssh_ip`: La dirección IP específica que permitirá el acceso SSH (cambiar por la tuya).
- `ec2_connect_ips`: Las direcciones IP del servicio Conexión de instancias de EC2 (por defecto: ["18.206.107.24/29"]).
- `ami_id`: El ID de la AMI para la instancia EC2 (por defecto: "ami-0c0b74d29acd0cd97").
- `instance_type`: El tipo de instancia EC2 (por defecto: "t2.micro").

Notas

    Asegúrate de actualizar la variable ssh_ip con tu dirección IP actual.
    El archivo .gitignore está configurado para ignorar archivos sensibles como *.tfstate y *.tfvars.
