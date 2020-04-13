pipeline {
environment {
 registry = "mohmagdy1016/fintest"
 registryCredential = 'dockerhubusr'
 dockerImage = ''
}
  agent any
  stages {
    stage('Build Docker') {
      steps {
        script {
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
      }
      }
    }
   stage('Deploy our image') {
   steps{
   script {
   docker.withRegistry( '', registryCredential ) {
   dockerImage.push()
 }
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
