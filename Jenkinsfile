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


     stage('Docker Build and Tag') {
               steps {

                    sh 'docker build -t nginxtest:latest .'
                      sh 'docker tag nginxtest nikhilnidhi/nginxtest:latest'
                    sh 'docker tag nginxtest nikhilnidhi/nginxtest:$BUILD_NUMBER'

              }
            }

      stage('Publish image to Docker Hub') {

                steps {
            withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
              sh  'docker push nikhilnidhi/nginxtest:latest'
              sh  'docker push nikhilnidhi/nginxtest:$BUILD_NUMBER'
            }

              }
            }

    }
}
