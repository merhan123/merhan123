FROM openjdk:17 as base
WORKDIR /app
COPY . .
RUN mvn clean install  -Dcheckstyle.skip

FROM tomcat:9
WORKDIR webapps
COPY --from=base /app/lib/spring-petclinic-3.0.0-SNAPSHOT.jar