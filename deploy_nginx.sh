cd terraform
echo [nginx] >  /var/lib/jenkins/workspace/PipeMota/ansible/hosts
terraform output |grep IP| sed 's/IP//g'|sed 's/,//g'|sed 's/ //g' >> /var/lib/jenkins/workspace/PipeMota/ansible/hosts

cd /var/lib/jenkins/workspace/PipeMota/ansible
ansible-playbook -i hosts nginx.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa
