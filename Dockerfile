FROM openjdk:17-ea-jdk
COPY ./target/datetime-checker-0.0.1-SNAPSHOT.jar /omar/
ENTRYPOINT ["java", "-jar","/omar/datetime-checker-0.0.1-SNAPSHOT.jar" ]