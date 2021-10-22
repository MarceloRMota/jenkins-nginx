de terraform
echo [nginx] >  ~/ansible
terraform output |grep ec2 >> ~/ansible

cd ~/ansible
ansible-playbook -i hosts nginx.yml -u ubuntu 
