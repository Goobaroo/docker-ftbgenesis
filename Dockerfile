# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="1.8.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Genesis"
LABEL homepage.icon="https://apps.modpacks.ch/modpacks/art/102/Genesis%20Pack%20Logo%20512x512.png"
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

ENV MOTD="FTB Genesis v1.8.1 Server Powered by Docker"
ENV LEVEL=FTBGenesis
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]