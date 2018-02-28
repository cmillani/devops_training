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
          return shouldBuild && (GIT_BRANCH != "master") && (GIT_BRANCH != "develop")
        }
      }
      steps {
        echo 'Analysing Code Quality...'
        withCredentials([usernamePassword(credentialsId: 'jenkins_scanner', usernameVariable: 'SONAR_USR', passwordVariable: 'SONAR_PWD')]) {
          sh '''
            cd devops_training
            fastlane metrics
            cd ..
          '''
        }
      }
    }

    stage('Deploy') {
      when {
        expression {
          return shouldBuild && (GIT_BRANCH == "master")
        }
      }
      steps {
        echo 'Production Version...'
        withCredentials([usernamePassword(credentialsId: 'jenkins_scanner', usernameVariable: 'SONAR_USR', passwordVariable: 'SONAR_PWD')]) {
          sh '''
            cd devops_training
            fastlane prod
            cd ..
          '''
        }
      }
    }
    
    stage('Demo') {
      when {
        expression {
          return shouldBuild && (GIT_BRANCH == "develop")
        }
      }
      steps {
        echo 'Development Version...'
        withCredentials([usernamePassword(credentialsId: 'jenkins_scanner', usernameVariable: 'SONAR_USR', passwordVariable: 'SONAR_PWD')]) { 
          sh '''
            cd devops_training
            fastlane demo
            cd ..
          '''
        }
      }
    }
  }
}

