pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
    }
    triggers {
        pollSCM('* * * * *')
    }
    tools {
        jdk 'JDK_17'
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
           sh scripts: 'mvn package'
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