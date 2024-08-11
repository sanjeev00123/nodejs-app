pipeline {
    agent any
    
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'echo $SUDO_PASSWORD | sudo -S terraform plan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'echo "$*" | sudo -S terraform apply -auto-approve'
                }
            }
        }
    }
}

