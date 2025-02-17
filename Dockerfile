FROM openjdk:8-jdk-alpine

RUN apk --no-cache add tzdata && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime

WORKDIR /
EXPOSE 8080
COPY /build/libs/tabtab_match-0.0.1-SNAPSHOT.jar /tabtab_match-0.0.1-SNAPSHOT.jar
COPY entrypoint.sh run.sh
RUN chmod 774 run.sh

ENV PROFILE=local

ENTRYPOINT ["./run.sh"]