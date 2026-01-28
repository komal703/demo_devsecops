pipeline {
  agent any

  environment {
    IMAGE_NAME = "bingo-devsecops"
  }

  stages {

    stage('Checkout Code') {
      steps {
        echo "Checking out source code"
        git branch: 'master', url: 'https://github.com/komal703/demo_devsecops.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        echo "Building Docker image"
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Trivy Security Scan') {
      steps {
        echo "Running Trivy vulnerability scan"
        sh '''
          trivy image --severity HIGH,CRITICAL $IMAGE_NAME || exit 1
        '''
      }
    }
  }

  post {
    success {
      echo "Pipeline completed successfully"
    }
    failure {
      echo "Pipeline failed due to security issues"
    }
    always {
      sh 'docker system prune -f'
    }
  }
}
