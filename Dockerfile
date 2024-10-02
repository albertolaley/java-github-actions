FROM openjdk:17-jdk-alpine

EXPOSE 8180

COPY ./build/libs/sayhello-0.0.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "sayhello-0.0.1-SNAPSHOT.jar"]

# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# COPY VERSION /
# ADD target/sayhello-0.0.1-SNAPSHOT.jar app.jar
# ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 -XshowSettings:vm "
# ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
