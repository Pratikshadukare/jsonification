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
  }
}
