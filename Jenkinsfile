pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers {
        pollSCM('* * * * *')
    }
    tools {
        jdk 'openjdk 17.0.8 2023-07-18'
    }
    stages {
        stage('vcs') {
            steps {
                git url: 'https://github.com/shaifalikhan5/game-of-life.git',
                branch: 'master'
            }
        }
        stage('build and package') {
            steps {
           sh script: 'mvn package'
            }
        }
        stage('reporting') {
            steps {
              archiveArtifacts artifacts : '**/target/*.jar'
              junit testResults : '**/surefire-reports/*.xml'

            }
        }
    }

}