FROM node:18-alpine

RUN mkdir /rich-art-music.com
WORKDIR /rich-art-music.com

RUN apk add --update --virtual .tmp-deps python3 make g++ && \
    rm -rf /var/cache/apk/*

COPY package.json .
RUN npm install --quiet

RUN apk del .tmp-deps

COPY . .

RUN npm run build
