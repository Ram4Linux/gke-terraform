pipeline {
    agent any

    environment {
        GOOGLE_CLOUD_KEY = credentials('gcp-key') // The Secret file ID in Jenkins
    }

    stages {
        stage('Terraform Init') {
            steps {
                withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
                    script {
                        // Export GCP credentials to the environment for Terraform
                        sh '''
                            export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
                            terraform init
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
                    script {
                        // Apply the Terraform configuration
                        sh '''
                            export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
                            terraform apply -auto-approve
                        '''
                    }
                }
            }
        }
    }
}
