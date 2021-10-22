#!/bin/bash

cd terraform 
terraform init
terraform fmt
terraform apply -auto-approve

echo [nginx] >  /var/lib/jenkins/workspace/PipeMota/ansible/hosts
terraform output |grep IP| sed 's/IP//g'|sed 's/,//g'|sed 's/ //g' >> /var/lib/jenkins/workspace/PipeMota/ansible/hosts
