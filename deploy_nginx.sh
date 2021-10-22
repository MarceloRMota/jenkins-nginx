de terraform
echo [nginx] >  ../ansible/hosts
terraform output |grep ec2 >> ../ansible/hosts

cd ../ansible
ansible-playbook -i hosts nginx.yml -u ubuntu 
