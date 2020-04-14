pipeline {
  agent any
  stages {
        stage('Build Docker') {
      steps {
        sh 'docker build --tag=hello .'
      }
    }
   stage('Deploy our image') {
   steps{
   withCredentials([usernamePassword(credentialsId: 'dockerhubusr', passwordVariable: 'dockerhubusrPassword', usernameVariable: 'dockerhubusrUser')]) {
	     	sh "docker login -u ${env.dockerhubusrUser} -p ${env.dockerhubusrPassword}"
   }
   }
   }
   stage('Upload Image') {
      steps {
        sh 'docker image push mohmagdy1016/fintest'
      }
    }
   stage("Cleaning up") {
      echo 'Cleaning up...'
      sh "docker system prune"
    }
  }
}
