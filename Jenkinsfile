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
                sh 'chmod +x mvnw'
                sh  'mvn clean install -X'
            
            //    sh 'ls -l target' 
            }
            
        }
    
            
        }
    }
    

