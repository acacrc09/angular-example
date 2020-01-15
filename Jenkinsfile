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
          npm install          
        '''
      }
    }
    stage ('Test Angular Cobertura') {
      steps{
        sh '''
            cd src
            run test -- --watch=false --code-coverage
            '''
      }
      post {
          always {
            junit "test-results.xml"
          }
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
  }
}
