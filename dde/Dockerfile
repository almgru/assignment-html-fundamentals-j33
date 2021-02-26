FROM alpine:edge

RUN apk add \
    --update \
    --no-cache \
    dumb-init \
    shadow \
    nodejs \
    npm \
    tidyhtml

RUN apk add \
    --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    kakoune

WORKDIR /app

COPY ./dde/res/entrypoint.sh /entrypoint.sh

ARG UID
ARG GID
ARG USER
ARG GROUP

RUN groupadd \
    --gid $GID \
    $GROUP \
    && \
    useradd \
    --uid $UID \
    --gid $GROUP \
    --shell /bin/sh \
    --no-user-group \
    --home-dir /home/$USER \
    --create-home \
    $USER

RUN chown $USER:$GROUP /app

USER $USER

COPY package.json .
COPY package-lock.json .

RUN npm install
ENV PATH=$PATH:/app/node_modules/.bin

COPY ./dde/res/config/kak /home/$USER/.config/kak
COPY ./dde/res/config/tidyrc /home/$USER/.tidyrc

ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "/entrypoint.sh" ]
