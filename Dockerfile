FROM node:latest
EXPOSE 3000
WORKDIR /app
COPY files/* /app/

RUN apt-get update &&\
    apt-get install -y iproute2 &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\
    chmod +x ct89ax0362zdy4v5

ENTRYPOINT [ "node", "server.js" ]
