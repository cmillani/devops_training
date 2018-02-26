pipeline {
  agent any
  environment {
    LC_ALL='en_US.UTF-8'
    LANG='en_US.UTF-8'    
    shouldBuild = true 
  }
  stages {
    stage('Checkout SCM') {
      steps {
        script {
          checkout scm
          result = sh (script: "git log -1 | grep '.*\[ci skip\].*'", returnStatus: true)
          if (result == 0) {
            echo ("'ci skip' spotted in git commit. Aborting.")
            shouldBuild = "false"
          }
        }
      }
    }
    stage('Code Quality') {
      when {
        expression {
          return shouldBuild
        }
      }
      steps {
        echo 'Analysing Code Quality...'
        sh '''
          cd devops_training
          carthage bootstrap
          sonar-scanner-swift
          cd ..
        '''
      }
    }

    stage('Deploy') {
      when {
        expression {
          return shouldBuild
        }
      }
      steps {
        echo 'Building...'
        sh '''
          
        '''
      }
    }
  }
}

