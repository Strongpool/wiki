FROM node:16-alpine AS runtime
ARG FEDARWIKI_VERSION=dev
ENV FEDARWIKI_VERSION=$FEDARWIKI_VERSION

RUN apk add aws-cli

RUN mkdir -p /wiki /data
WORKDIR /wiki

ADD *.coffee /wiki/
ADD *.json /wiki/
ADD index.js /wiki/
ADD vendor /wiki/vendor

RUN npm install \
  && cd /wiki/vendor/wiki-client \
  && npm install \
  && npx grunt build \
  && cd /wiki/vendor/wiki-security-arweave \
  && npm install \
  && npx grunt build

EXPOSE 3000

ADD entrypoint ./entrypoint

ENTRYPOINT ["./entrypoint"]
