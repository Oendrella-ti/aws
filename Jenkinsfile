pipeline {
    agent any

    environment {
        // Optional: specify Terraform binary path if not in default PATH
        TERRAFORM = "D:/Interview_Project/Selfmade/aws"
    }

    stages {
        stage('Checkout Repository') {
            steps {
                echo "Checking out repository..."
                checkout scm
                sh 'pwd'
                sh 'ls -al'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "Initializing Terraform..."
                sh "${TERRAFORM} init"
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Creating Terraform plan..."
                sh "${TERRAFORM} plan -out=tfplan"
            }
        }

        stage('Terraform Apply') {
            steps {
                echo "Applying Terraform plan..."
                // Use -auto-approve for non-interactive run
                sh "${TERRAFORM} apply -auto-approve tfplan"
            }
        }
    }

    post {
        always {
            echo "Pipeline finished. Listing workspace:"
            sh 'ls -al'
        }
    }
}
