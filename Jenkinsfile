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
                    sh 'mvn clean install sonar:sonar -Dsonar.projectKey=groupId:artifactId -Dsonar.host.url=http://localhost:9000 -Dsonar.login=loginHASH  -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
             // sh './mvnw clean org.sonasonar:sonarrsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar' 
                     }
                   
}  
                } 
           }
            
        }
    }
    

