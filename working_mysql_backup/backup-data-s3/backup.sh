#!/bin/bash

set -o pipefails
d=$(date +"%d-%m-%y")
t=$(date +"%T")
newt=$(echo $t | sed 's/:/-/g')

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION
cd /var/lib 
tar -zcvf  bkup.tar.gz mysql/* 
ls -lh
aws s3 cp bkup.tar.gz s3://$BUCKET_NAME/$newt 
echo "ending"