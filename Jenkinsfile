pipeline{
    agent any
    stages{
        stage("sonarQube check"){
            agent any
            steps{
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
