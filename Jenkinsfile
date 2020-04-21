pipeline {
  agent any
  stages {
            stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
		 stage('Lint Dockerfile') {
          steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint Dockerfile'
                    }
                }
            }
        }
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
   stage('Deploying') {
	   steps {
		   withAWS(credentials: 'Devops', region: 'us-east-2') {
    sh 'kubectl apply -f app-deployment.yml'
}
	   }
    }

   stage('Cleaning up') {
      steps {
      sh 'docker system prune -f'
    }
   }
  }
}


