pipeline {
  agent any
	 environment {
        VIRTUAL_ENV = "${env.WORKSPACE}/venv"
      }
  stages {
	          stage ('Install_Requirements') {
            steps {
                sh """
                    echo ${SHELL}
                    [ -d venv ] && rm -rf venv
                    #virtualenv --python=python2.7 venv
                    virtualenv venv
                    #. venv/bin/activate
                    export PATH=${VIRTUAL_ENV}/bin:${PATH}
                    pip install --upgrade pip
                    pip install -r requirements.txt -r dev-requirements.txt
                    make clean
                """
            }
        }
	 stage('Lint') {
      steps {
        sh 'pylint --disable=R,C,W1203 app.py'
           }
           }
}
}
