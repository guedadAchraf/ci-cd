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

      stage('Initialize') {
                  steps {
                      script {
                          def dockerHome = tool 'myDocker'
                          env.PATH = "${dockerHome}/bin:${env.PATH}"
                      }
                  }
              }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myimage .'
                }
            }
        }
        stage('Push Image to Hub') {
            steps {
                script {
                    // Set your Docker Hub password directly
                    sh 'docker login -u guedad.achraf@gmail.com -p SbiqSbiq123456'
                    sh 'docker push guedadachraf/repo-cicd'
                }
            }
        }
    }
}
