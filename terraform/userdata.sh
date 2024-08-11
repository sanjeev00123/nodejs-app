#!/bin/bash

sudo apt update -y
DD_API_KEY= DD_SITE="us5.datadoghq.com" bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
sudo apt install docker.io -y
snap install aws-cli --classic -y
sudo docker login -u "username" -p "pass"
git clone https://github.com/goldybawa48/nodejs-app.git
cd nodejs-app
#!/bin/bash

mkdir -p /home/ubuntu/.aws

# Create the credentials file with your AWS keys
cat <<EOF > /home/ubuntu/.aws/credentials
[default]
aws_access_key_id=""
aws_secret_access_key=""
EOF

# Set appropriate permissions for the credentials file
chown -R ubuntu:ubuntu /home/ubuntu/.aws
chmod 600 /home/ubuntu/.aws/credentials

# Optionally, you can set the default region in the config file
cat <<EOF > /home/ubuntu/.aws/config
[default]
region=us-east-1
output=json
EOF

# Set appropriate permissions for the config file
chmod 600 /home/ubuntu/.aws/config

# Ensure the AWS CLI is available for the ubuntu user
echo "export PATH=$PATH:/home/ubuntu/.aws" >> /home/ubuntu/.bashrc

# Source the .bashrc to make the changes take effect immediately
source /home/ubuntu/.bashrc

cd nodejs-app
aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin 595496445232.dkr.ecr.us-east-1.amazonaws.com
sudo docker build -t node-app .
sudo docker tag node-app:latest 595496445232.dkr.ecr.us-east-1.amazonaws.com/node-app:latest
sudo docker push 595496445232.dkr.ecr.us-east-1.amazonaws.com/node-app:latest
sudo docker pull 595496445232.dkr.ecr.us-east-1.amazonaws.com/node-app:latest

sudo docker run -p 3000:3000 595496445232.dkr.ecr.us-east-1.amazonaws.com/node-app:latest
