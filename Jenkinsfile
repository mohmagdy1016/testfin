pipeline {
  agent any
  stages {
	  stage('Preparing VirtualEnv') {
		  steps {
        echo 'Creating virtualenv ...'
        sh 'python3 -m venv ~/.devops'
    sh 'source ~/.devops/bin/activate'
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
