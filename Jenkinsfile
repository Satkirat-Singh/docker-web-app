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
                    bat 'docker run -d -p 80:80 myimage'
                    
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    bat 'curl http://localhost:8080'
                    
                }
            }
        }

        stage('Clean Up Docker') {
            steps {
                script {
                    bat 'docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
                    
                }
            }
        }
    }

    post {
        always {
            script {
                bat 'docker system prune -f'
                
            }
        }
    }
}
