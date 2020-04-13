pipeline {
  agent any
  stages {
    stage('Build Docker') {
      steps {
        docker build --tag=hello .
      }
    }
    stage('Login to dockerhub') {
      steps {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
          sh 'docker login -u mohmagdy1016 -p ${dockerhubpwd}'
        }
      }
    }
    stage('Upload Image') {
      steps {
        sh 'make upload'
      }
    }
  }
}
