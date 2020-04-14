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
                    python3 -m venv ~/.venv
		    virtualenv venv
                    . venv/bin/activate
                    export PATH=${VIRTUAL_ENV}/bin:${PATH}
                    pip install --upgrade pip &&\
                               pip install -r /var/lib/jenkins/workspace/testfin_master/requirements.txt
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
