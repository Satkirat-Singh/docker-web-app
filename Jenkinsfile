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

        stage('Run Docker Container') {
            steps {
                script {
                    // Exposing container on port 80 (mapped to localhost port 8080)
                    bat 'docker run -d -p 8080:80 myimage'
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    // Testing the application on localhost:8080, since port 8080 is mapped to the container
                    bat 'curl http://localhost:8080'
                }
            }
        }

        stage('Clean Up Docker') {
            steps {
                script {
                    // Clean up all Docker containers
                    bat 'for /F "tokens=*" %i IN (\'docker ps -aq\') DO docker rm -f %i'
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up dangling Docker resources
                bat 'docker system prune -f'
            }
        }
    }
}
