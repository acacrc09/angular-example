pipeline{
  agent any
  stages{
    stage ('Checkout codigo fuente'){
      steps{
        checkout scm
      }
    }
    stage ('Instalar dependencias'){
      steps{
        sh          
          'npm install --verbose -d'
          'npm install --save classlist.js'     
      }
    }
    stage ('Revisión calidad con LINT'){
      steps{
        sh '$(npm bin)/ng lint'
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
            openshift.withProject('banco-ripley') {
              openshift.selector("bc", "angular-example").startBuild("--from-dir=./dist/", "--wait=true", "--follow", "--loglevel=8")
            }
          }
        }
      }
    }

  }
}