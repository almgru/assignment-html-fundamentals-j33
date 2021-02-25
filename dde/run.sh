#!/bin/sh

. ./.env

docker run \
	--volume /app/node_modules \
	--volume "$PWD":/app \
	--publish 8080:8080 \
	--env TERM=xterm-256color \
	--user "$DDE_USER":"$DDE_GROUP" \
	--interactive \
	--tty \
	--rm \
	assignment-html-fundamentals-j33
