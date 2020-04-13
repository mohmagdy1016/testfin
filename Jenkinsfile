pipeline {
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
   withCredentials([usernamePassword(credentialsId: 'dockerhubusr', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     	sh "docker login -u ${env.dockerhubusrUser} -p ${env.dockerhubusrPassword}"
   }
    stage('Upload Image') {
      steps {
        sh 'make upload'
      }
    }
  }
}
