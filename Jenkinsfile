#!/usr/bin/env groovy

pipeline {
  agent any
  environment {
    LC_ALL='en_US.UTF-8'
    LANG='en_US.UTF-8'    
    shouldBuild = true 
  }
  stages {
    stage('Check CI Skip') {
      steps {
        script {
          result = sh (script: "git log -1 | grep '.*\\[ci skip\\].*'", returnStatus: true)
          if (result == 0) {
            echo ("'ci skip' spotted in git commit. Aborting.")
            shouldBuild = false
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
          fastlane metrics
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
          cd devops_training
          fastlane build          
          ls fastlane
          ls **/**
          cd ..
        '''
      }
    }
  }
}

