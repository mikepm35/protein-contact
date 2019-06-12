# protein-contact

docker build -t protein-contact .

docker tag protein-contact:latest 530583866435.dkr.ecr.us-east-1.amazonaws.com/protein-contact:latest

docker push 530583866435.dkr.ecr.us-east-1.amazonaws.com/protein-contact:latest