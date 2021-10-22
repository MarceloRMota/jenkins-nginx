#!/bin/bash

cd terraform
curl "http://$(terraform output | grep ec2 | awk '{print $2;exit}' |sed -e "s/\",//g"|cut -b 8-)"