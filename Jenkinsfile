pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hello-world-java:latest' // Docker image name
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'javac HelloWorld.java'  // Compiles Java code
            }
        }

        stage('Package') {
            steps {
                // Corrected jar command to package the class into a jar
                sh 'jar cfe HelloWorld.jar HelloWorld HelloWorld.class'
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                    docker build -t $DOCKER_IMAGE .  // Builds Docker image
                """
            }
        }
    }
    
    post {
        success {
            echo 'Build completed successfully.'
        }
        failure {
            echo 'Build failure'
        }
    }
}
