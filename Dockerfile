FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY build/libs/ROOT.war app.war
ENTRYPOINT ["java","-jar","app.war"]