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
        sh '''          
          npm install          
        '''
      }
    }
    stage ('Test Angular Cobertura') {
      steps{
        sh '''            
            npm test
            '''
      }
      post {
          always {
            junit "**/TESTS*.xml"
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
