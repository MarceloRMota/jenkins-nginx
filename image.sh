mkdir image

cd terraform
IMAGE=$(terraform output| grep "i-"|sed  's/,//g')

cat <<EOF > ../image/print.tf
provider "aws" {
  region = "sa-east-1"
}

resource "aws_ami_from_instance" "nginx_mmota_image" {
  name               = "nginx_mmota_image"
  source_instance_id = ${IMAGE}
}
output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.nginx_mmota_image.id}"
  ]
}
© 2021 GitHub, Inc.
Terms

EOF
cd ../image/
terraform init
terraform apply -auto-approve
