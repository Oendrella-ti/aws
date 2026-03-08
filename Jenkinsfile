pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        TF_VAR_key_name = 'eks2'  // SSH key name in AWS
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Oendrella-ti/aws'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Outputs') {
            steps {
                sh 'terraform output'
            }
        }
    }

    post {
        success {
            echo 'Terraform deployed successfully!'
        }
        failure {
            echo 'Terraform deployment failed.'
        }
    }
}
