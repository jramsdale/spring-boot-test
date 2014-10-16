FROM dockerfile/java:oracle-java8
MAINTAINER Jeff Ramsdale <jeff.ramsdale@gmail.com>

#WORKDIR /opt

#RUN export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")
RUN echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed s:jre/bin/java::)" >> /etc/environment

ADD target/spring-boot-test-0.1.0-SNAPSHOT.jar /tmp/application.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/urandom", "-jar", "/tmp/application.jar"]

EXPOSE 8080