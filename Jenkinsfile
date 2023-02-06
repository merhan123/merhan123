pipeline{
    agent any
    stages{
        stage("sonarQube check"){
            agent any
             tools{
                 maven 'mvn-default'
            }
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'ls -l'
                script{
                   // withSonarQubeEnv(credentialsId: 'sonarPassword') {
               //    withSonarQubeEnv(installationName: 'sonarqube') {
                 withSonarQubeEnv('sonarqube') {
                    sh 'chmod +x mvnw'
                    sh 'ls -l'
                    sh 'mvn clean sonar:sonar'
                     }
                //    timeout(time: 0.1, unit: 'HOURS' ){
                   //     def qg = waitForQualityGate()
                     //       if (qg.status != 'Ok'){
                       //     error "pipeline faliur : ${qg.status}"
                   // }}
                    
                   
}  
                } 
           }
            
        }
    }
    
