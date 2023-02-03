pipeline{
    agent any
    stages{
        stage("sonarQube check"){
            agent any
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                script{
                    withSonarQubeEnv(credentialsId: 'sonarPassword') {
                    sh 'chmod +x gradlew'
                    sh './gradlew sonarqube'
}
                } 
            }
            
        }
    }
    
}
