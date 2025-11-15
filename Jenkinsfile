pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('Dockerhub-token') 
    IMAGE_NAME = "sarweshvaran/devops-capstone"
    APP_HOST = "ubuntu@172.31.14.155"
  }

  stages {
    stage('Clone Repository') {
      steps {
        git branch: 'main', url: 'https://github.com/Sarwesh0910/devops-capstone.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:latest .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        sh '''
          echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
          docker push $IMAGE_NAME:latest
        '''
      }
    }

    stage('Deploy to EC2') {
      steps {
        sshagent(['app-ec2-ssh-key']) {
          sh '''
            ssh -o StrictHostKeyChecking=no $APP_HOST '
              docker pull sarweshvaran/devops-capstone:latest &&
              docker stop app || true &&
              docker rm app || true &&
              docker run -d --name app -p 80:3000 sarweshvaran/devops-capstone:latest
            '
          '''
        }
      }
    }
  }

  post {
    success {
      echo 'Deployment successful!'
    }
    failure {
      echo 'Deployment failed. Check logs.'
    }
  }
}
