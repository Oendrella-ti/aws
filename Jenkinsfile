pipeline {
    agent any

    environment {
        // Adjust this path if Terraform is installed elsewhere
        PATH = "D:/Interview_Project/Selfmade/aws"
    }

    stages {
        stage('Checkout Repo') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], 
                          userRemoteConfigs: [[url: 'https://github.com/Oendrella-ti/aws']]])
                sh 'pwd'                // shows current directory
                sh 'ls -al'             // lists all files in workspace
                sh 'terraform version'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
