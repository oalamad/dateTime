FROM centos
RUN yum update
RUN yum install java-17-openjdk-devel
COPY ./target/datetime-checker-0.0.1-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-jar","datetime-checker-0.0.1-SNAPSHOT.jar" ]