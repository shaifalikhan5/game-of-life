pipeline {
    agent { label 'worker1' }
    triggers { pollSCM('* * * * *') }
    environment {
        PATH="$PATH:/opt/maven3.9/bin"
    }
    stages{
        stage('git version') {
            steps{
                git url: 'https://github.com/shaifalikhan5/game-of-life.git',branch: 'master'
            }
        }
     stage('build_stage') {
        JAVA_HOME = tool 'jdk17'
        PATH = "${env.JAVA_HOME}/bin/java:${env.PATH}"
            steps{
                sh 'mvn clean package'
            }
            }
     stage('archeve_artifacts') {
            steps{
              archiveArtifacts artifacts: '**/target/*.jar'
              junit testResults : '**/target/surefire-reports/*.xml'   
            }
            }
     stage('sonarqube_integration') {
            steps{
                sh 'mvn -v'
            }
        }
    stage('upload artifacts') {
            steps{
                sh 'mvn -v'
            }
        }     
    }
}