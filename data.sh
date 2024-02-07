#!/bin/bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws configure set aws_access_key_id "AKIAX2ZR6ZL7HKIQ6MFY" && aws configure set aws_secret_access_key "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" && aws configure set region "us-west-2"
sudo aws s3 cp s3://mybucket-apurva/newnote.txt /tmp/
hostname >> /tmp/output.txt
sudo cp /tmp/output.txt /tmp/newnote.txt
sudo aws s3 cp /tmp/newnote.txt s3://mybucket-apurva
