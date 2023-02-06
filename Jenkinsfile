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
                    sh 'mvn clean package  sonar:sonar'
                   // sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar' 
                     }
                   
}  
                } 
           }
            
        }
    }
    

