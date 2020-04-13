pipeline {
  agent any
  stages {
    stage('Build Docker') {
      steps {
        sh 'docker build --tag=hello .'
      }
    }
    stage('Login to dockerhub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'docker login -u mohmagdy1016 -p passwordVariable'
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
