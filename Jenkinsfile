pipeline{
    agent any
    stages{
        stage("sonarQube check"){
            agent{ 
                docker {
                    image 'openjdk:11'
            }}
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
