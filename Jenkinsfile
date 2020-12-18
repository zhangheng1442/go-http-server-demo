def demoapp 
pipeline {
    agent any
    stages {
        stage('Build') {
            echo 'Building..'
            sh "docker -v"
	        checkout scm
            demoapp = docker.build("hebut09/devops-demo")
        }
        stage('Push') {
            echo 'Push to docker hub'
            demoapp.push("${env.BUILD_NUMBER}")
        }
    }
}
