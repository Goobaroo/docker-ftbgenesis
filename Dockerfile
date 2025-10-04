# syntax=docker/dockerfile:1

FROM openjdk:17-jdk-buster

LABEL version="1.9.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Genesis"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/7b/7b0240be5ab726c06865ea4f7c412e795540b9e408e9eda834031e82e3fd0d6e.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Genesis:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Genesis v1.9.1 Server Powered by Docker"
ENV LEVEL=FTBGenesis
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]