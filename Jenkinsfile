pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven_3.9.6'
        PATH = "$MAVEN_HOME/bin:$PATH"
        DOCKER_HOME = tool 'Docker_20.10.0'
        DOCKER_PATH = "$DOCKER_HOME/bin:$PATH"
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
                    sh 'docker build -t myimage:tagv1 .'
                }
            }
        }
        stage('Push Image to Hub') {
            steps {
                script {
                    // Set your Docker Hub password directly
                    def dockerhubPassword = 'SbiqSbiq123456'
                    sh "docker login -u guedadachraf -p ${dockerhubPassword}"
                    sh 'docker push guedadachraf/repo-cicd:tagv1'
                }
            }
        }
    }
}
