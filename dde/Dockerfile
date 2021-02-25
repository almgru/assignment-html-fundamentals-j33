FROM alpine:edge

RUN apk add \
    --update \
    --no-cache \
    dumb-init \
    nodejs \
    npm

RUN apk add \
    --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    kakoune

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install
ENV PATH=$PATH:/app/node_modules/.bin

COPY ./dde/res/entrypoint.sh /entrypoint.sh
COPY ./dde/res/config/kak /root/.config/kak

ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "/entrypoint.sh" ]
