pipeline{
   agent {
    node {
      label 'nodejs8'
    }
  }
  stages{
    stage ('Checkout codigo fuente'){
      steps{
        checkout scm
      }
    }
    stage ('Instalar dependencias'){
      steps{
        sh '''
          npm install --verbose -d          
        '''
      }
    }    
    stage ('Revisión calidad con LINT'){
      steps{
        sh '$(npm bin)/ng lint'
      }
    }
    stage ('Inspección de Codigo con Sonarqube'){
      steps{
        sh '$(npm bin)/npm run sonar'
      }
    }    
    stage ('Construcción Aplicación') {
      steps{
        sh '$(npm bin)/ng build --prod --build-optimizer'
      }
    }
    stage ('Desplegar') { 
      steps{
        script {
          openshift.withCluster() {
            openshift.withProject('poc-angular') {
              openshift.selector("bc", "angularexamples").startBuild("--from-dir=./dist", "--wait=true", "--follow", "--loglevel=8")
            }
          }
        }
      }
    }
  }
}


