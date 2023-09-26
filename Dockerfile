FROM maven AS build-image
WORKDIR /app
ADD /pom.xml /app/pom.xml
ADD /src /app/src
RUN mvn package -Dmaven.test.skip

FROM amazoncorretto:17
COPY --from=build-image /app/target/ManageSweeper-0.0.1-SNAPSHOT.jar /app.jar
COPY --from=build-image /app/target/opentelemetry-javaagent.jar /opentelemetry-javaagent.jar
ENTRYPOINT java -jar -javaagent:opentelemetry-javaagent.jar app.jar