pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'javac -d build src/*.java'
            }
        }
        
        stage('Test') {
            steps {
                sh 'java -cp build Main'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'echo "Deployment to production environment"'
            }
        }
    }
}
