FROM alpine

MAINTAINER dojomi

ENV SWARM_CLIENT_VERSION 3.3
ENV COMMAND_OPTIONS=""

USER root

RUN apk update
RUN apk --no-cache add openjdk8 ca-certificates wget \
&& rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN adduser -G root -D jenkins
RUN wget -q https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar -P /home/jenkins

COPY run.sh /home/jenkins/run.sh
RUN chmod +x /home/jenkins/run.sh

WORKDIR /home/jenkins
RUN ls -lha

CMD ["sh", "run.sh"]
