#!/bin/bash

cd terraform
curl "http://$(terraform output |grep IP| sed 's/IP//g'|sed 's/,//g'|sed 's/ //g'|sed 's/"//'|sed 's/"//')/home"