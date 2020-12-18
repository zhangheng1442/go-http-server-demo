def demoapp 
pipeline {
    agent any
    deleteDir()
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                demoapp = docker.build("hebut09/devops-demo")
            }
        }
        stage('Push') {
            steps {
                echo 'Push to docker hub'
                demoapp.push("${env.BUILD_NUMBER}")
            }
        }
    }
}
