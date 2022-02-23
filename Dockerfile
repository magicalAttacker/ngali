FROM ubuntu:latest
ADD entrypoint.sh /entrypoint.sh
RUN apt update &&DEBIAN_FRONTEND=noninteractive apt install -y curl wget rclone git jq openjdk-17-jre-headless aria2 && wget https://github.com/zxbu/webdav-aliyundriver/releases/download/v2.4.2/webdav-aliyundriver-2.4.2.jar
ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
