pipeline {
    agent any
    tools {
        maven 'M3'
    }
    environment {
        PORT = "8060"
        CONTAINER_NAME = "java_maven"
        IMAGE_NAME = "ahmedkabil/java-maven"
    }
    stages{
        stage("clean up"){
            steps{
                sh "docker rm ${CONTAINER_NAME} --force || true" 
            }
        }
        stage("scm checkout"){
            steps {
               checkout scm
            }
        }

        stage("build jar file"){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }
        stage("build image"){
            steps{
                sh 'docker build --build-arg PORT=${PORT} -t ${IMAGE_NAME} .'
            }
        }
        stage("deploy"){
            steps{
                sh 'docker container run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${IMAGE_NAME}'
                echo "Successfully deployed to http://${Node_IP}:${PORT}"
            }
            
        }
    }
}