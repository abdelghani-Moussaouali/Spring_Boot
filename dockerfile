# Use an official Java runtime
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom files
COPY mvnw pom.xml ./
COPY .mvn .mvn

# Copy source code
COPY src src

# Give mvnw executable permission
RUN chmod +x mvnw

# Build the app
RUN ./mvnw clean package -DskipTests

# Expose port
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "target/BACKSPRING.jar"]
