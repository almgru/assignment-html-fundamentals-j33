#!/bin/sh

. ./.env

docker build \
	--build-arg UID="$DDE_UID" \
	--build-arg GID="$DDE_GID" \
	--build-arg USER="$DDE_USER" \
	--build-arg GROUP="$DDE_USER" \
	--tag assignment-html-fundamentals-j33 \
	--file ./dde/Dockerfile \
	.
