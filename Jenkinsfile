pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers {
        pollSCM('* * * * *')
    }
    tools {
        maven 'maven3.9'
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
           sh script: 'mvn clean package'
            }
        }
        stage('reporting') {
            steps {
              archiveArtifacts artifacts : '**/*.war'
              junit testResults : '**/surefire-reports/*.xml'

            }
        }
    }

}