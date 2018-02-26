pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sonar-scanner-swift
      }
    }

    stage('Test') {
      steps {
        echo 'Testing...'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying...'
      }
    }
  }
}
