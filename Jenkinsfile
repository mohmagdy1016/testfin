pipeline {
  agent any
  stages {
	 stage('Lint') {
      steps {
        sh 'pylint --disable=R,C,W1203 app.py'
           }
           }
  }
}
