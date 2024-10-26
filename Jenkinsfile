pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    bat 'git clone https://github.com/Satkirat-Singh/docker-web-app.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t myimage .'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    // Run the container in detached mode with port mapping
                    bat 'docker run -d -p 8081:80 --name mycontainer myimage'
                    
                    // Wait to allow the container to fully initialize
                    sleep(time: 10, unit: 'SECONDS')
                }
            }
        }

        stage('Check Logs') {
            steps {
                script {
                    // Print container logs to ensure it started successfully
                    bat 'docker logs mycontainer'
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    // Test accessibility of the application
                    bat 'curl http://localhost:8081'
                }
            }
        }
    }
}