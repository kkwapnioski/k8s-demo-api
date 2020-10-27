FROM openjdk:8-jdk-alpine as build
COPY . /src/app
WORKDIR /src/app
RUN ./gradlew build

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/src/app/build/libs/*.jar
COPY --from=build ${JAR_FILE} app.jar
ENV COLOR blue
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]