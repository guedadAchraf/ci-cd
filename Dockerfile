# Use an official Maven runtime as a parent image
FROM maven:3.6.3-openjdk-17-slim

# Set the working directory in the container
WORKDIR /usr/src/java8

# Copy the Maven project files to the container
COPY . .

# Build the Maven project
RUN mvn clean install

# Set the entry point to run the Maven project
CMD ["java", "-jar", "target/java8-1.0-SNAPSHOT.jar"]
