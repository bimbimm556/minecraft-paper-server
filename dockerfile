FROM openjdk:17-jdk-slim
WORKDIR /data
ARG VERSION=1.21.6
RUN apt-get update && apt-get install -y curl && \
    curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds/latest/download
COPY eula.txt ./
RUN echo "eula=true" > eula.txt
EXPOSE 25565
CMD ["java", "-Xms512M", "-Xmx1G", "-jar", "paper.jar", "nogui"]
