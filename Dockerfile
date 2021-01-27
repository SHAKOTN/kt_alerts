FROM gradle:6.7 as builder

COPY build.gradle .
COPY src ./src

# Build a release artifact.
RUN gradle clean build --no-daemon

FROM openjdk:8-jre-alpine
#RUN apk update && apk add bash
COPY --from=builder /home/gradle/build/libs/gradle.jar /app/helloworld.jar
WORKDIR /app
