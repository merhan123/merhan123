pipeline{
    agent any
    tools {
        maven "mvn-default"
    }
    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "35.226.51.205:31521"
        NEXUS_REPOSITORY = "Atos"
        NEXUS_CREDENTIAL_ID = "nx-auth"
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
                 //   sh 'mvn clean package sonar:sonar'
                    sh 'mvn clean  package sonar:sonar -Dcheckstyle.skip  -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
                   
                 //   sh 'mvn clean  org.sonasonar:sonarrsource.scanner.maven:sonar-maven-plugin:3.9:sonar -Dcheckstyle.skip  -Dsonar.host.url=http://34.134.247.195:9000   -Dsonar.sources=src/main/java/ -Dsonar.java.binaries=target/classes'
               //  sh 'mvn clean org.sonasonar:sonarrsource.scanner.maven:sonar-maven-plugin:3.9:sonar' 
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


        stage('upload file to nexus'){
            steps{
                dir(path:'target'){
                    unstash "spring"
                }
                script{

                    nexusArtifactUploader artifacts: 
                     [
                         [
                             artifactId: '', 
                             classifier: '', 
                             file: 'target/spring-petclinic-3.0.0-SNAPSHOT.jar', 
                             type: 'jar'
                             ]], 
                             credentialsId: 'nx-auth', 
                             groupId: '', 
                             nexusUrl: '35.226.51.205:31521', 
                             nexusVersion: 'nexus3', 
                             protocol: 'http', 
                             repository: 'Atos', 
                            version: ''
                    // pom = readMavenPom file: "pom.xml";
                    // filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    // echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    // artifactPath = filesByGlob[0].path;
                    // artifactExists = fileExists artifactPath;
                    // if(artifactExists) {
                    //     echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                    //     nexusArtifactUploader(
                    //         nexusVersion: NEXUS_VERSION,
                    //         protocol: NEXUS_PROTOCOL,
                    //         nexusUrl: NEXUS_URL,
                    //         groupId: pom.groupId,
                    //         version: pom.version,
                    //         repository: NEXUS_REPOSITORY,
                    //         credentialsId: NEXUS_CREDENTIAL_ID,
                    //         artifacts: [
                    //             [artifactId: pom.artifactId,
                    //             classifier: '',
                    //             file: artifactPath,
                    //             type: pom.packaging],
                    //             [artifactId: pom.artifactId,
                    //             classifier: '',
                    //             file: "pom.xml",
                    //             type: "pom"]
                    //         ]
                    //     );
                    // } else {
                    //     error "*** File: ${artifactPath}, could not be found";
                    // }
                }
                }
            }

        }
    
    
    }
