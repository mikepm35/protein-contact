#!/bin/bash
# Assumes container ready aws linux image ami-0f812849f5bc97db5
sudo yum install -y unzip
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
$(aws ecr get-login --no-include-email --region us-east-1)
docker pull 530583866435.dkr.ecr.us-east-1.amazonaws.com/protein-contact:latest
docker run --name protein-contact -d -p 8099:8099 --rm 530583866435.dkr.ecr.us-east-1.amazonaws.com/protein-contact:latest