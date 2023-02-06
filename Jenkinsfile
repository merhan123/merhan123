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
                withSonarQubeEnv('sonarqube') {
                sh 'pwd'
                sh 'ls -l'
                sh 'which java'
                sh 'chmod +x mvnw'
                sh 'chmod +x mvnw.cmd'
                sh 'java --version'
              //  sh './mvnw.cmd'
                sh './mvnw clean sonar:sonar'
                }
            //    sh 'ls -l target' 
            }
            
        }
    
            
        }
    }
    

