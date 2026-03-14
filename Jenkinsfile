pipeline {
    agent any
    tools {
        maven 'M3'
    }

    stages{
        stage("clean up"){
            steps{
                sh "docker rm java_app --force || true" 
            }
        }
        stage("scm checkout"){
            steps {
               // git branch: 'main', url: 'https://github.com/ahmed-kabil/java-app-test.git'
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
                sh 'docker build --build-arg PORT=8060 -t ahmedkabil/java-app .'
            }
        }
        stage("deploy"){
            steps{
                sh 'docker container run -d --name java_app -p 8060:8060 ahmedkabil/java-app'
                echo "Successfully deployed to http://192.168.50.134:8060"
            }
            
        }
    }
}