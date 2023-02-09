FROM openjdk:17 
EXPOSE 8090
ADD target/spring-petclinic-3.0.0-SNAPSHOT.jar
ENTRYPOINT [ "java","-jar","/spring-petclinic-3.0.0-SNAPSHOT.jar" ]