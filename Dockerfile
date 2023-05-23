# Use an appropriate base image with Java installed
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file and any other necessary files to the container
COPY target/your-app.jar /app/your-app.jar

# Expose the port that your Java application listens on
EXPOSE 8080

# Define the command to run your Java application
CMD ["java", "-jar", "/app/your-app.jar"]
