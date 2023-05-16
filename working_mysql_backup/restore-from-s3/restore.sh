#!/bin/sh
# Configure AWS CLI
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION

mkdir -p /var/lib/mysql
# mkdir -p /var/lib/mysql/mysql
# Download latest file from S3 bucket
latest_file=$(aws s3api list-objects-v2 --bucket $BUCKET_NAME --query "reverse(sort_by(Contents, &LastModified))[0].Key" --output text)
aws s3 cp s3://$BUCKET_NAME/$latest_file /var/lib/

# Untar the downloaded file
cd /var/lib/ && tar -xvzf /var/lib/$latest_file
ls -al
# Remove downloaded filecd 
#rm -rf new

# Start the actual container process
exec "$@"

