# Dockerized/Reproducable development environment

This Docker image includes all development dependencies for my development
workflow on this project. When started, it runs a live server which reloads on
changes in the background and a shell in the foreground. The editor *Kakoune*
is available with the `kak` command and is configured to automatically format
the html file on save.

## Building

1. `git submodule update --init`
2. Build the image:
   ```bash
   docker build \
       --tag assignment-html-fundamentals-j33 \
       --file ./dde/Dockerfile \
       .
   ```

## Starting

```bash
docker run \
    --volume /app/node_modules \
    --volume "$PWD":/app \
    --publish 8080:8080 \
    --env TERM=xterm-256color \
    --interactive \
    --tty \
    --rm \
    assignment-html-fundamentals-j33
```
