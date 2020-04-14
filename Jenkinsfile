pipeline {
  agent any
  stages {
	  stage('Preparing VirtualEnv') {
		  steps {
        echo 'Creating virtualenv ...'
        sh '/var/lib/jenkins/workspace/testfin_master/python3 -m venv ~/.devops'
    sh 'source /var/lib/jenkins/workspace/testfin_master/.devops/bin/activate'
    sh 'pip install --upgrade pip &&\
                pip install -r requirements.txt'

   }
  }
	 stage('Lint') {
      steps {
        sh 'pylint --disable=R,C,W1203 app.py'
           }
           }
}
}
