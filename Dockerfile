# FROM maven:3.9-eclipse-temurin-17-alpine AS builder
# WORKDIR /app
# COPY pom.xml .
# COPY ./src ./src
# RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
# COPY --from=builder /app/target/*.jar app.jar
COPY ./target/*.jar app.jar
ARG PORT=8070
EXPOSE $PORT
ENV PORT=$PORT
CMD ["java","-jar","app.jar","--server.port=${PORT}"]