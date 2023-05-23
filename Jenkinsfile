pipeline {
  agent any
  environment {
    SCANNER_HOME = tool 'SonarQube'
  }
  stages {
    stage('Test') {
      steps {
        withSonarQubeEnv('SonarQube') {
          sh "${SCANNER_HOME}/bin/sonar-scanner \
            -Dsonar.exclusions=**/*.java \
            -Dsonar.projectKey=javaPipeline1 \
            -Dsonar.projectName=Unreal-Engine-pro2"
        }
      }
    }
    stage('Quality Gate') {
      steps {
        // Run the quality gate analysis and check
        script {
          def qualityGate = waitForQualityGate()
          if (qualityGate.status != 'OK') {
            error("Quality Gate failed! Check the code quality.")
          }
        }
      }
    }
    stage('Build') {
      steps {
        // Build your Java code using Maven or Gradle
        // Replace the build command as per your project's build system
        sh 'mvn clean install'  // Example Maven build command
      }
    }

    stage('Docker Build') {
      steps {
        // Build the Docker image with your Java application
        // Replace the image name and Dockerfile path as needed
        sh 'docker build -t your-image-name -f path/to/Dockerfile .'
      }
    }

    stage('Docker Deploy') {
      steps {
        // Push the Docker image to your Docker registry
        // Replace the registry URL, image name, and credentials as needed
        withDockerRegistry(credentialsId: 'your-credentials-id', url: 'https://your-docker-registry-url') {
          sh 'docker push your-image-name'
        }

        // Deploy the Docker container
        // Replace the container name, ports, and other options as needed
        sh 'docker run -d --name your-container-name -p 8000:8000 your-image-name'
      }
    }
  }
}
