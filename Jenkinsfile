pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    sh 'git clone https://github.com/Satkirat-Singh/docker-web-app.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myimage .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:80 myimage'
                }
            }
        }

        stage('Test Application Accessibility') {
            steps {
                script {
                    sh 'curl -s http://localhost:8081'
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up Docker resources
                sh 'docker system prune -f'
            }
        }
    }
}
