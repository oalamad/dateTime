FROM openjdk:17-ea-jdk
ARG JAR_FILE
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar","app.jar" ]