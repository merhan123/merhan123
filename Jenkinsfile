pipeline{
    agent any
    tools {
        maven "mvn-default" 
  //      Docker "docker"
    }
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "35.226.51.205:31521"
        NEXUS_REPOSITORY = "Atos"
        NEXUS_CREDENTIAL_ID = "nx-auth"
        imagename = "springclinic"
        dockerImage = ''
    }
    stages{
         
       stage("sonarQube check"){
           // tools{jdk 'jdk-default'}
            steps{
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                sh 'ls -l'
               // sh 'rm -rf target'
                script{
                   // withSonarQubeEnv(credentialsId: 'jenkins-sonar1') {
               //    withSonarQubeEnv(installationName: 'sonarqube') {
                 withSonarQubeEnv('sonarqube') {
                    sh 'chmod +x mvnw'
                    sh 'ls -l'
  //                  sh 'mvn clean  package sonar:sonar -Dcheckstyle.skip  -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
                   
                 //   sh 'mvn clean  org.sonasonar:sonarrsource.scanner.maven:sonar-maven-plugin:3.9:sonar -Dcheckstyle.skip  -Dsonar.host.url=http://34.134.247.195:9000   -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
              //      sh 'mvn -Dmaven.test.failure.ignore=true clean  sonar:sonar -Dcheckstyle.skip '
                   
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
            agent{
                docker {
        	image 'maven:3.5.0'
        }}
            steps{
             
                git branch: 'devops', url: 'https://github.com/merhan123/merhan123.git'
                sh 'pwd'
                //sh 'mvn clean install checkstyle:checkstyle'
                sh 'mvn clean install  -Dcheckstyle.skip'
  

         //       sh  'mvn clean install'
                sh 'ls -l target'
                 dir(path:'target'){
                    stash name: "spring",
                    includes: "spring-petclinic-3.0.0-SNAPSHOT*.jar"
                }
            }
               
             
        }


        stage('build docker image'){

            steps{
                dir(path:'target'){
                    unstash "spring"
                }
                script{
                  //dockerImage = docker.build imagename
                  sh 'docker build -t merhan/spring-petclinic:latest .'
                }
                }
            }


            stage('upload file to nexus'){
            steps{
                dir(path:'target'){
                    unstash "spring"
                }
                script{

                    nexusArtifactUploader artifacts: 
                     [
                         [
                             artifactId: 'spring-petclinic', 
                             classifier: '', 
                             file: 'target/spring-petclinic-3.0.0-SNAPSHOT.jar', 
                             type: 'jar'
                             ]], 
                             credentialsId: 'nx-auth', 
                             groupId: 'org.springframework.samples', 
                             nexusUrl: '35.226.51.205:31521', 
                             nexusVersion: 'nexus3', 
                             protocol: 'http', 
                             repository: 'demoapp', 
                            version: '3.0.1'
                     
                }
                }
            }

        }
    
    
    }
