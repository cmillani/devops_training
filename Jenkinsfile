pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh 'cd devops_training'
        sh 'carthage bootstrap'
        sh 'sonar-scanner-swift'
        sh 'cd ..'
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
