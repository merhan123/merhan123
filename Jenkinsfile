pipeline{
    agent any
    stages{
        stage("Build Code"){
            agent any
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'ls -l'
                sh  'mvn clean install' 
            }
            
        }
        stage("sonarQube check"){
            agent any
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'ls -l'
                script{
                    withSonarQubeEnv(credentialsId: 'sonarPassword') {
                    sh 'chmod +x gradlew'
                    sh 'pwd'
                    sh 'ls -l'
                    //sh '../../gradlew sonarqube'
                    sh 'mvn clean install'
}
                } 
            }
            
        }
    }
    
}
