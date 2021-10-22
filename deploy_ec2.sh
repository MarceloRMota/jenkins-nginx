#!/bin/bash

cd terraform 
terraform init
terraform fmt
terraform apply -auto-approve

sleep 10
