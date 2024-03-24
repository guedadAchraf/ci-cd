pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven_3.9.6'
        PATH = "$MAVEN_HOME/bin:$PATH"
      imagename = "yenigul/hacicenkins"
     registryCredential = 'dockerHub'
     dockerImage = ' '
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/guedadAchraf/ci-cd.git']]])
                sh 'mvn clean install'
            }
        }
 stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    }
}
