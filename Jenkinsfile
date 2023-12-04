pipeline {
    agent any
    environment {
        PATH="$PATH:/opt/maven/bin"
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers {
        pollSCM('* * * * *')
    }
    tools {
        maven 'maven3.9'
        jdk 'jdk-8'
    }
    stages {
        stage('vcs') {
            steps {
                git url: 'ls',
                branch: 'master'
            }
        }
        stage('build and package') {
            environment {
                JAVA_HOME = tool 'jdk8'
                PATH="${env.JAVA_HOME}/bin/java:${env.PATH}"
            }
            steps {
           sh script: 'mvn clean package'
            }
        }
        stage('artifact and test') {
          steps {
             archiveArtifacts  artifacts: '**/target/*.war'
            junit testResults : '**/surefire-reports/*.xml'
          }

        }
        
    }

}