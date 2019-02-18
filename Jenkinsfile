pipeline {
  agent { label 'jenkins-slave' }

  environment {
    registry = "screamofthepast/exam"
    registryCredential = 'docker_login'
  }

  stages {
    stage ('Python tests') {
      steps {
        sh """
          python3 -m venv venv
          . venv/bin/activate
          pip install wheel
          pip install -e '.[test]'
          coverage run -m pytest
          coverage report 
          deactivate
          ls
        """
      }
    }
    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build registry + ":py_app"
        }
      }
    }
    stage('Pushing image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
          }
        }
      }
    }
    stage('Clean existing image') {
        steps {
         sh "docker rmi $registry:py_app"
        }
    }
  }
  post { 
    cleanup { 
        cleanWs()
    }
  }
}