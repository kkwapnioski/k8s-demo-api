FROM openjdk:8-jdk-alpine as build
RUN ./gradlew build

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=build/libs/*.jar
COPY --from=build ${JAR_FILE} app.jar
ENV COLOR blue
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]