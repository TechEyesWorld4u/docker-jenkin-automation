# Use an official OpenJDK runtime as a parent image
#FROM openjdk:11-jre-slim
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /learninghub

# Copy the application JAR file to the container
COPY target/docker-git-k8s.jar /learninghub/docker-git-k8s.jar
#ADD target/docker-git-k8s.jar /learninghub/docker-git-k8s.jar

# Expose the port that the application runs on
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "/learninghub/docker-git-k8s.jar"]
