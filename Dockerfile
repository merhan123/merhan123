FROM anapsix/alpine-java 
EXPOSE 8090
ADD target/spring-petclinic-3.0.0-SNAPSHOT.jar /home/spring-petclinic-3.0.0-SNAPSHOT.jar
ENTRYPOINT [ "java","-jar","/home/spring-petclinic-3.0.0-SNAPSHOT.jar" ]