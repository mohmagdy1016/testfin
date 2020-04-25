pipeline {
  agent any
  stages {
		 stage('Lint Dockerfile') {
          steps {
                script {
                    docker.image('hadolint/hadolint:latest-debian').inside() {
                            sh 'hadolint Dockerfile'
                    }
                }
            }
        }
	stage('Security Scan') {
              steps { 
                 aquaMicroscanner imageName: 'alpine:latest', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
              }
         }         
        stage('Build Docker') {
      steps {
	sh 'docker build --build-arg APP_PORT=80 --tag=mohmagdy1016/fintest .'
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
	 sh './upload_docker.sh'
      }
    }
   stage('Deploying') {
	   steps {
		   withAWS(credentials: 'Devops', region: 'us-east-2') {
	         sh 'kubectl set image deployment/nginx nginx=${registry}:latest'
                 sh 'kubectl apply -f app-deployment.yml'
	         sh 'kubectl get nodes'
                 sh 'kubectl get pods'
			   
	            
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


