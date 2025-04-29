pipeline {
    agent any

    environment {
        GOOGLE_CLOUD_KEY = credentials('gcp-key') // The Secret file ID in Jenkins
    }

    stages {
        stage('Checkout Git') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/Ram4Linux/gke-terraform.git'
            }
        }

        stage('Terraform Version') {
            steps {
                script {
                    // Check if Terraform is installed
                    sh 'terraform version'
                }
            }
        }

        stage('Debugging') {
            steps {
                script {
                    // Debug: Check environment variable GOOGLE_CREDENTIALS
                    sh 'echo $GOOGLE_CREDENTIALS'
                    sh 'ls -l $GOOGLE_CREDENTIALS'  // Verify if the credential file exists
                }
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
                    script {
                        // Debug: Confirm if the file is available and Terraform init
                        sh '''
                            echo "Using GCP Credentials from $GOOGLE_CREDENTIALS"
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
                        // Debug: Confirm if the file is available and Apply Terraform
                        sh '''
                            echo "Using GCP Credentials from $GOOGLE_CREDENTIALS"
                            export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
                            terraform apply -auto-approve
                        '''
                    }
                }
            }
        }
    }
}
