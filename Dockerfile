FROM java:8
EXPOSE 8090
VOLUME /tmp
ADD target/spring-boot-rest-example-0.3.0.jar app.jar
RUN bash -c  'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
