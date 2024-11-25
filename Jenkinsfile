pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hello-world-java:latest'  // Docker image name
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'javac HelloWorld.java'  // Compiles the Java code
            }
        }

        stage('Package') {
            steps {
                // Optionally, create a JAR file, but it's not required for running the .class file
                sh 'jar cfe HelloWorld.jar HelloWorld HelloWorld.class'
            }
        }

        stage('Docker Build') {
            steps {
                // Build the Docker image, including the compiled HelloWorld.class
                sh """
                    docker build -t $DOCKER_IMAGE .
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
