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
        withCredentials([usernamePassword(credentialsId: 'dockerhubusr', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'docker login -u USERNAME -p passwordVariable'
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
