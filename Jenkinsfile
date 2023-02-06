pipeline{
    agent any
    stages{
        stage("sonarQube check"){
            agent any
            tools{
                 maven 'mvn-default'
                 gradle 'gradle-default'
            }
           
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                withSonarQubeEnv('sonarqube') {
                sh 'pwd'
                sh 'ls -l'
                sh 'which java'
                sh 'chmod +x ./gradlew'
                sh 'chmod +xu mvnw.cmd'
                sh 'gradle --version'
                sh 'pwd'
                 sh 'cd /var/jenkins_home/workspace/spring-petclinic'
                sh 'java --version'
              //  sh './mvnw.cmd'
                sh './gradlew sonarqube'
                }
            //    sh 'ls -l target' 
            }
            
        }
    
            
        }
    }
    

