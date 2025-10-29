pipeline {
  agent any

  environment {
    DOCKER_CREDENTIALS_ID = 'Dockerhub-key'           // Your Jenkins credential ID
    DOCKER_USER = 'sarweshvaran'                      // Your DockerHub username
    APP_EC2_IP = 'your.ec2.ip.address'                // Replace with your EC2 IP
    SSH_KEY = credentials('ec2-ssh-key')              // Your EC2 SSH key credential ID
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/sarweshvaran/devops-capstone.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          def imageName = "${DOCKER_USER}/devops-capstone"
          withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
            sh "docker build -t ${imageName} ."
            sh "echo ${DOCKERHUB_PASS} | docker login -u ${DOCKERHUB_USER} --password-stdin"
            sh "docker push ${imageName}"
          }
        }
      }
    }

    stage('Deploy to EC2') {
      steps {
        script {
          def imageName = "${DOCKER_USER}/devops-capstone"
          sh """
            ssh -i ${SSH_KEY} ubuntu@${APP_EC2_IP} << EOF
              docker pull ${imageName}
              docker stop capstone || true
              docker rm capstone || true
              docker run -d --name capstone -p 80:3000 ${imageName}
            EOF
          """
        }
      }
    }
  }
}
