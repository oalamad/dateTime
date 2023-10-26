FROM openjdk:17-ea-jdk
COPY /var/lib/jenkins/workspace/dateTime-pipeline/target/datetime-checker-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar","app.jar" ]