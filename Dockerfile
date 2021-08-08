FROM openjdk:8u121-jre
LABEL author="Kolybelkin@gmail.com"
COPY target/swagger-spring-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar","--spring.config.location=file:/deployments/config/application.properties"]