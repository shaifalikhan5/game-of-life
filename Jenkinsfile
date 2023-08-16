pipeline {
 agent any
  options {
        timeout(time: 1, unit: 'HOURS') 
    }
    triggers { pollSCM('* * * * *') }
    tools {
        maven 'maven3.9'
    }
    stages {
        stage(' git clone stage') {
            steps {
                git url: 'https://github.com/shaifalikhan5/game-of-life.git',
                 branch: 'master'
            }
            stage('build stage') {
                steps {
                    sh script: 'mvn clean package'

                }
                stage('artifacts') {
                    steps {
                        archiveArtifacts artifacts: '**/target/*.jar'
                        junit testResults : '**/target/*.xml'
                    }
                }
            }

        }
    }


}