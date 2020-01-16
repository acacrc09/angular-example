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
          npm install --verbose -d 
          npm install --save classlist.js
        '''
      }
    }
    stage ('test'){
      steps{
        sh '''
          npm run test -- --watch=false --code-coverage          
        '''
      }      
    }
    stage ('Qtest') {
      steps{
        submitJUnitTestResultsToqTest([apiKey: '1f1389cf-5f6f-4225-af29-6bb29248464d', containerID: 1723433, containerType: 'test-cycle', createNewTestRunsEveryBuildDate: true, createTestCaseForEachJUnitTestClass: true, createTestCaseForEachJUnitTestMethod: false, overwriteExistingTestSteps: true, parseTestResultsFromTestingTools: true, parseTestResultsPattern: '**/**.xml', projectID: 93046, qtestURL: 'https://masisapoc.qtestnet.com/', submitToAReleaseAsSettingFromQtest: false, submitToExistingContainer: true, utilizeTestResultsFromCITool: false]) 
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


