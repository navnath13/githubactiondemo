# =======================
# Build stage
# =======================
FROM maven:3.9.4-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml first for better layer caching
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application (skip tests)
RUN mvn clean package -DskipTests


# =======================
# Runtime stage
# =======================
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy JAR from build stage
COPY --from=builder /app/target/*.jar githubaction.jar

# Expose application port
EXPOSE 9898

# Run Spring Boot app
ENTRYPOINT ["java", "-jar", "githubaction.jar"]
