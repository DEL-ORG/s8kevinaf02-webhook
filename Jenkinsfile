pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: '')
        string(name: 'IMAGE_NAME', defaultValue: '', description: '')
        string(name: 'CONTAINER_NAME', defaultValue: '', description: '')
        string(name: 'PORT_ON_DOCKER_HOST', defaultValue: '', description: '')
    }
    stages {
        stage('Clone Repository') {
            steps {
                script {
                    git credentialsId: 'e50d2df5-49e1-4eff-83a1-6fbcc5169464',
                        url: 'https://github.com/DEL-ORG/s8kevinaf02-webhook.git',
                        branch: "${params.BRANCH_NAME}"
                }
            }
        }
        stage('Checking the code') {
            steps {
                bat 'dir'
            }
        }
        stage('Building the dockerfile') {
            steps {
                bat """
                    docker build -t ${params.IMAGE_NAME} .
                    docker images | findstr ${params.IMAGE_NAME}
                """
            }
        }
        stage('Deploying the application') {
            steps {
                bat """
                    docker run -itd -p ${params.PORT_ON_DOCKER_HOST}:80 --name ${params.CONTAINER_NAME} ${params.IMAGE_NAME}
                    docker ps | findstr ${params.CONTAINER_NAME}
                """
            }
        }
    }
}
