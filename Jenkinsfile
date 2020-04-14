pipeline {
  agent any
  stages {
	  stage('Preparing VirtualEnv') {
		  steps {
        echo 'Creating virtualenv ...'
        sh 'virtualenv --no-site-packages .env'
    sh '. .env/bin/activate'
    sh 'ls -all'
    if (fileExists('requirements.txt')){
        sh 'pip install -r requirements.txt'
    }
   }
  }
  }
	 stage('Lint') {
      steps {
        sh 'pylint --disable=R,C,W1203 app.py'
           }
           }
  }
}
