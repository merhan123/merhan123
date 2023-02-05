pipeline{
    agent any
    stages{
        stage("Build Code"){
            agent any
            tools{
                 maven 'mvn-default'
            }
           
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'ls -l'
                sh 'which java'
                sh 'java --version'
            //    sh  'mvn clean install'
            
            //    sh 'ls -l target' 
            }
            
        }
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
                   withSonarQubeEnv(installationName: 'sonarqube') {
                    sh 'chmod +x mvnw'
                    sh 'ls -l'
                    sh 'apt-get update && apt-get install dos2unix.'
                    sh 'dos2unix mvnw'
                    sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar' 
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
    

