#!/bin/bash

cd terraform
terraform destroy

cd ../image
terraform destroy
