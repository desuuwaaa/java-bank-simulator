
# Stage 1: Build the Java application
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./srC
RUN mvn clean package -DskipTests

# Stage 2: Run the Java application
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
EXPOSE 10000
ENTRYPOINT ["sh", "-c", "java -Dserver.port=${PORT:-10000} -jar app.jar"]
