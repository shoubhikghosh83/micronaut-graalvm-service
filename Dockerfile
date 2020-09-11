FROM oracle/graalvm-ce:20.1.0-java8 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-graalvm-service
WORKDIR /home/app/micronaut-graalvm-service

RUN native-image --no-server -cp target/micronaut-graalvm-service-*.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-graalvm-service/micronaut-graalvm-service /app/micronaut-graalvm-service
ENTRYPOINT ["/app/micronaut-graalvm-service"]
