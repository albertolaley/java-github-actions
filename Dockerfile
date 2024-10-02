FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /usr/app

# Copy the JAR file from your local machine to the container
# Replace 'your-app.jar' with the actual name of your JAR file
COPY target/sayhello-0.0.1-SNAPSHOT.jar /usr/app/app.jar

# Expose the port your application will run on (adjust as needed)
EXPOSE 8180

# Run the JAR file using Java
ENTRYPOINT ["java", "-jar", "app.jar"]