cd ansible
ansible-playbook -i hosts nginx.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/id_rsa
