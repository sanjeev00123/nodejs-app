## NODEJS APP DEPLOY ON EC2 WITH PIPELINE
## Steps for the project 
### Step 1

1. Clone this repository local.

`git@github.com:sanjeev00123/nodejs-app.git`   

### Step 2

1. Install jenkins on the local system.

    ```bash
    sudo apt install openjdk-8-jdk -y
    sudo apt install openjdk-11-jdk -y
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
    sudo apt update
    sudo apt install jenkins -y
    sudo systemctl start jenkins
    sudo ufw allow 8080
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword

2. Login the jenkins and install terraform plugin.

### Step 3

1. Make terraform code vich makes VPC, EC2, ECS, RDS, S3, IAM roles and security groups.
2. It's availible in this repo just edit the entries.

### Step 4

1. Login to the datadog and copy the datadog agent command.
2. Replace this with the id I entered in my user data.

### Step 5

1. Now create a pipeline in jenkins.
2. Code of pipeline is in my repo. Just copy paste it.

### Step 6

1. Run sudo visudo and add this line at the end of file jenkins ALL=(ALL) NOPASSWD: /usr/bin/terraform

### Step 7

1. We are using jenkins in the localsystem so that we have to move all terraform files to jenkins workspace.
2. jenkins workspace cd /var/lib/jenkins/workspaces/<your-pipeline-name>
3. Move the terraform files to this exect location.

### Steo 8

1. Now Go to jenkins and click on build now.
2. Now see your pipeline overview.

## Note

1. The userdata of instance takes arrount 10 - 15 minutes to execute properly.
2. So wait 10 - 15 minutes and then verify, Copy the instance public IP.
3. <Instance-publicip>:3000, search this then you see the one white page.
