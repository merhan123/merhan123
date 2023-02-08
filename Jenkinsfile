pipeline{
    agent any
    tools {
        maven "mvn-default"
    }
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "35.226.51.205:31521"
        NEXUS_REPOSITORY = "http://35.226.51.205:31521/repository/Atos/"
        NEXUS_CREDENTIAL_ID = "nexus-auth"
    }
    stages{
         
       stage("sonarQube check"){
            
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
                    sh 'mvn -Dmaven.test.failure.ignore=true clean  sonar:sonar -Dcheckstyle.skip '
                   
}  
                } }
       }




/* 
           stage("Quality Gate"){
            steps{
            withSonarQubeEnv('sonarqube') {
             timeout(time: 20, unit: 'MINUTES' ){
                waitForQualityGate abortPipeline: true

                    }}}
        } */

            stage("Deploy"){
             
            steps{
             
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                //sh 'mvn clean install checkstyle:checkstyle'
                sh 'mvn clean install  -Dcheckstyle.skip'
  

         //       sh  'mvn clean install'
                sh 'ls -l target'
             }
        }


        stage('upload file to nexus'){
            steps{
                script{
                  //  pom = readMavenPom file: "pom.xml";
                //    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                   // echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory}"
                    //artifactPath = filesByGlob[0].path;
                   // artifactExists = fileExists artifactPath
                    
                    nexusArtifactUploader artifacts: 
                    [
                        [
                            artifactId: 'libsass-maven-plugin', classifier: '',
                            file: 'target/spring-petclinic-3.0.0-SNAPSHOT.jar', 
                            type: 'jar'
                            ]
                            ], 
                        credentialsId: 'nexus-auth', 
                        groupId: 'com.gitlab.haynes', 
                        nexusUrl: '35.226.51.205:31521', 
                        nexusVersion: 'nexus3', 
                        protocol: 'http', 
                        repository: 'http://35.226.51.205:31521/repository/Atos/', 
                        version: '0.2.26'
                }
            }

        }
    
    
    }}
