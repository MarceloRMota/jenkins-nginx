#!/bin/bash

cd terraform 
terraform fmt
terraform apply -auto-approve

sleep 10
