# Dockerized/Reproducable development environment

This Docker image includes all development dependencies for my development
workflow on this project. When started, it runs a live server which reloads on
changes in the background and a shell in the foreground. The editor *Kakoune*
is available with the `kak` command and is configured to automatically format
the html file on save.

## How to use

### 0. Make sure you are in the root directory of this repo.

To simplify the Dockerfile, it assumes that your current directory is in the
root of this repo. So make sure you are in the parent folder of the `dde`
folder (the one that contains `package.json`).

### 1. Define `.env` file

1. Open `dotenv.template` and set `DDE_UID` to your user id (get it with
`id -u`), `DDE_GID` (`id -g`), `DDE_USER` to your username (`id -un`) and
`DDE_GROUP` to the name of your primary group (`id -gn`).
2. `cp dotenv.template .env`

### 2. Setup SSH-key

1. Create an ssh-key:
   ```bash
       ssh-keygen \
           -t ed25519\
           -C "$USER"@html-fundamentals \
           -f ./dde/ssh/html-fundamentals
   ```
2. Add public key to remote.

### 3. Get Kakoune plugins

`git submodule update --init`

## 4. Building the Docker image

```bash
./dde/build.sh
```

## 5. Starting the Docker image

```bash
./dde/run.sh
```
