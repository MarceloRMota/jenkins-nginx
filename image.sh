cd terraform
IMAGE=$(terraform output| grep "i-"|sed  's/,//g')

cat <<EOF > print.tf
resource "aws_ami_from_instance" "nginx_mmota" {
  name               = "nginx_mmota"
  source_instance_id = ${IMAGE}
}
EOF

terraform apply -auto-approve
