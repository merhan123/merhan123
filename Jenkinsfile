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
                sh 'rm -rf target'
                script{
                   // withSonarQubeEnv(credentialsId: 'sonarPassword') {
               //    withSonarQubeEnv(installationName: 'sonarqube') {
                 withSonarQubeEnv('sonarqube') {
                    sh 'chmod +x mvnw'
                    sh 'ls -l'
                //    sh 'mvn clean install sonar:sonar -Dsonar.projectKey=groupId:artifactId -Dsonar.host.url=http://34.134.247.195/:9000 -Dsonar.login=loginHASH  -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
             // sh './mvnw clean org.sonasonar:sonarrsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar' 
                    sh 'mvn clean checkstyle:checkstyle '
                     }
                   
}  
                } }
           

           stage("Quality Gate"){
            steps{
             timeout(time: 20, unit: 'MINUTES' ){
                waitForQualityGate abortPipeline: true
                   //     def qg = waitForQualityGate()
                     //       if (qg.status != 'Ok'){
                       //     error "pipeline faliur : ${qg.status}"


                    }}
        } 

            stage("Deploy"){
             tools{
                 maven 'mvn-default'
            }
            steps{
             
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'mvn checkstyle:checkstyle'
                sh 'ls -l'
         //       sh  'mvn clean install'
                sh 'ls -l target'
             }
        }



    }
    
}
