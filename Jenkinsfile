pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                script {
                    // Clone the repository from GitHub
                    bat 'git clone https://github.com/Satkirat-Singh/docker-web-app.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t myimage .'
                }
            }
        }

        stage('Run Docker Container for Testing on Port 8081') {
            steps {
                script {
                    // Run Docker container on port 8081 for testing
                    bat 'docker run -d --name webapp_test -p 8081:80 myimage'
                }
            }
        }

        stage('Test Application on Port 8081') {
            steps {
                script {
                    // Test the application on port 8081 using curl
                    bat 'curl http://localhost:8081'
                }
            }
        }

        stage('Test Title Presence on Homepage') {
            steps {
                script {
                    // Check if the title "Welcome to My Web App" is present on the homepage
                    def response = bat(script: 'curl -s http://localhost:8081 | findstr "Welcome to My Web App"', returnStatus: true)
                    if (response != 0) {
                        error "Homepage title test failed!"
                    } else {
                        echo "Homepage title test passed!"
                    }
                }
            }
        }

        stage('Test Navigation Links') {
            steps {
                script {
                    // Check if navigation links (Sign Up and Login) are present
                    def response = bat(script: 'curl -s http://localhost:8081 | findstr "Sign Up" "Login"', returnStatus: true)
                    if (response != 0) {
                        error "Navigation links test failed!"
                    } else {
                        echo "Navigation links test passed!"
                    }
                }
            }
        }

        stage('Test Form Elements on Login Page') {
            steps {
                script {
                    // Check if form elements on login page are present
                    def response = bat(script: 'curl -s http://localhost:8081/loginform.html | findstr "Email" "Password"', returnStatus: true)
                    if (response != 0) {
                        error "Login form test failed!"
                    } else {
                        echo "Login form test passed!"
                    }
                }
            }
        }

        stage('Stop and Remove Test Container') {
            steps {
                script {
                    // Stop and remove the test container
                    bat 'docker stop webapp_test && docker rm webapp_test'
                }
            }
        }

        stage('Run Docker Container for Final Deployment on Port 8082') {
            steps {
                script {
                    // Run the Docker container on port 8082 for final access
                    bat 'docker run -d --name webapp_final -p 8082:80 myimage'
                }
            }
        }

        stage('Verify Final Deployment on Port 8082') {
            steps {
                script {
                    // Verify the application on port 8082
                    bat 'curl http://localhost:8082'
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
