pipeline {
    agent any

    environment {
        GOOGLE_CLOUD_KEY = credentials('gcp-key') // The Secret file ID in Jenkins
    }

    stages {
        stage('Checkout Git') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/your-username/your-repo.git'
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

        stage('Terraform Init') {
            steps {
                withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
                    script {
                        // Export GOOGLE_APPLICATION_CREDENTIALS environment variable
                        // pointing to the GCP credentials file
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
                        // Export GOOGLE_APPLICATION_CREDENTIALS environment variable
                        // and apply the Terraform configuration
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
