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
           //     sh  'mvn clean install'
                sh 'which java'
                sh 'java --version'
                sh 'grep -e PATH -e JAVA_HOME'
              //  sh 'ls -l'
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
                   withSonarQubeEnv('sonarqube') {
                   // sh 'chmod +x gradlew'
                   // sh 'pwd'
                    //sh 'ls -l'
                    //sh '../../gradlew sonarqube'
                    sh 'chmod +x mvnw'
                    sh 'mvn sonar:sonar' }
                    timeout(time: 0.1, unit: 'HOURS' ){
                        def qg = waitForQualityGate()
                            if (qg.status != 'Ok'){
                            error "pipeline faliur : ${qg.status}"
                    }}
                   // sh 'mvn clean install'
                    
                 //   sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
}
                } 
            }
            
        }
    }
    

