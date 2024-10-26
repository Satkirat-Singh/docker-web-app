pipeline {
    agent any

    environment {
        IMAGE_NAME = 'myimage'
        CONTAINER_NAME = 'mycontainer'
        GIT_REPO_URL = 'https://github.com/Satkirat-Singh/docker-web-app.git'
        WORKSPACE_DIR = 'docker-web-app'
    }

    stages {
        stage('Prepare Workspace') {
            steps {
                script {
                    // Check if the repository folder already exists
                    if (fileExists(WORKSPACE_DIR)) {
                        // Navigate into the directory and pull the latest changes
                        dir(WORKSPACE_DIR) {
                            bat 'git pull'
                        }
                    } else {
                        // Clone the repository if it doesn't exist
                        bat "git clone ${GIT_REPO_URL} ${WORKSPACE_DIR}"
                    }
                }
            }
        }

        stage('Cleanup Existing Containers and Images') {
            steps {
                script {
                    // Remove any previous containers with the specified name
                    bat "docker rm -f ${CONTAINER_NAME} || echo 'No previous container to remove.'"

                    // Remove previous images with the specified name
                    bat "docker rmi -f ${IMAGE_NAME} || echo 'No previous image to remove.'"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir(WORKSPACE_DIR) {
                    script {
                        bat "docker build -t ${IMAGE_NAME} ."
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -d -p 8081:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    bat 'curl http://localhost:8081'
                }
            }
        }
    }
}
