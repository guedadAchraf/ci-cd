pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven_3.9.6'
        PATH = "$MAVEN_HOME/bin:$PATH"
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/guedadAchraf/ci-cd.git']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t javatechie/devops-integration .'
                }
            }
        }
        stage('Push Image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'id-secret-text-dockerhub', variable: 'var-docker-hub')]) {
                        sh "docker login -u guedadachraf -p ${var-docker-hub}"
                    }
                    sh 'docker push javatechie/devops-integration'
                }
            }
        }
    }
}
