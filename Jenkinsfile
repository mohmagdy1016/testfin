pipeline {
  agent any
      stages {
	 stage('Lint') {
      steps {
        sh 'pylint3 --disable=R,C,W1203 app.py'
           }
           }
}
}
