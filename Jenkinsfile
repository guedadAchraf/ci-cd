pipeline{

	agent {label 'linux'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerHub')
	}

	stages {

	    stage('gitclone') {

			steps {
				git 'https://github.com/guedadAchraf/ci-cd.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t thetips4you/nodeapp_test:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push thetips4you/nodeapp_test:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}