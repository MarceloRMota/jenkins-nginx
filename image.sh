mkdir image

cd terraform
IMAGE=$(terraform output| grep "i-"|sed  's/,//g')

cat <<EOF > ../image/print.tf
resource "aws_ami_from_instance" "nginx_mmota" {
  name               = "nginx_mmota"
  source_instance_id = ${IMAGE}
}
EOF
cd ../image/
terraform init
terraform apply -auto-approve
