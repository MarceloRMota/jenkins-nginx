cd /var/lib/jenkins/workspace/PipeMota/ansible
ansible-playbook -i hosts nginx.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa
