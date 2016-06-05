FROM java:8
EXPOSE 8090
ADD target/springboot-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
