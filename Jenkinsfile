pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'git clone https://github.com/Satkirat-Singh/docker-web-app.git'
                    } else {
                        bat 'git clone https://github.com/Satkirat-Singh/docker-web-app.git'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker build -t myimage .'
                    } else {
                        bat 'docker build -t myimage .'
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker run -d -p 80:80 myimage'
                    } else {
                        bat 'docker run -d -p 80:80 myimage'
                    }
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'curl http://localhost:8080'
                    } else {
                        bat 'curl http://localhost:8080'
                    }
                }
            }
        }

        stage('Clean Up Docker') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
                    } else {
                        bat 'docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                if (isUnix()) {
                    sh 'docker system prune -f'
                } else {
                    bat 'docker system prune -f'
                }
            }
        }
    }
}
