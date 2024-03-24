pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven_3.9.6'
        PATH = "$MAVEN_HOME/bin:$PATH"
        DOCKER_PATH = "/usr/bin/docker"  // Specify the path to the Docker binary
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
                    sh "${DOCKER_PATH} build -t myimage ."
                }
            }
        }

        stage('Push Image to Hub') {
            steps {
                script {
                    // Set your Docker Hub password directly
                    sh "${DOCKER_PATH} login -u guedadachraf -p SbiqSbiq123456"
                    sh "${DOCKER_PATH} push guedadachraf/repo-cicd"
                }
            }
        }
    }
}
