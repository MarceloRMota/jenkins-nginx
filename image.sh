mkdir image

cd terraform
IMAGE=$(terraform output| grep "i-"|sed  's/,//g')

cat <<EOF > ../image/print.tf
provider "aws" {
  region = "sa-east-1"
}

resource "aws_ami_from_instance" "nginx_mmota" {
  name               = "nginx_mmota"
  source_instance_id = ${IMAGE}
}
EOF
cd ../image/
terraform init
terraform apply -auto-approve
