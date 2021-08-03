FROM openjdk:16
LABEL author="Kolybelkin@gmail.com"
COPY build/libs/kuber-app-1-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]