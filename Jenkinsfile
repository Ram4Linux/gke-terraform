pipeline {
  agent any

  environment {
    GOOGLE_CLOUD_KEY = credentials('gcp-key') // Jenkins credential ID
  }

  stages {
    stage('Terraform Init') {
      steps {
        withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
          sh '''
            export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
            terraform init
          '''
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([file(credentialsId: 'gcp-key', variable: 'GOOGLE_CREDENTIALS')]) {
          sh '''
            export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
            terraform apply -auto-approve
          '''
        }
      }
    }
  }
}
