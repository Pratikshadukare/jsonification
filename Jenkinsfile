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
            -D sonar.projectKey=javaPipeline \
            -D sonar.projectName=Unreal-Engine-Project1"
        }
      }
    }
  }
}
