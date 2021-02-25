#!/bin/sh

docker run \
	--volume /app/node_modules \
	--volume "$PWD":/app \
	--publish 8080:8080 \
	--env TERM=xterm-256color \
	--interactive \
	--tty \
	--rm \
	assignment-html-fundamentals-j33
