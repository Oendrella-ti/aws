pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Oendrella-ti/aws'
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init -reconfigure -input=false'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -input=false tfplan'
            }
        }

    }
}
