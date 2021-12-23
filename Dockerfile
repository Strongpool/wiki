FROM node:16-alpine AS runtime
ARG FEDARWIKI_VERSION=dev
ENV FEDARWIKI_VERSION=$FEDARWIKI_VERSION

RUN apk add aws-cli

RUN mkdir -p /wiki /data
WORKDIR /wiki

ADD *.coffee /wiki/
ADD *.json /wiki/
ADD index.js /wiki/
ADD init.sh ./init.sh

RUN npm install

EXPOSE 3000

CMD "./init.sh"
