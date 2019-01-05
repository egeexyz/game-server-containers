# Game Server Containers

[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/EMbcgR8)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/Egeeio/game-server-containers/blob/master/LICENSE)

The goal of this project is to containerize game servers so that they are easy to deploy, run, and manage.

## Prerequisites

You will need the following things properly installed to deploy a game server:

- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/get-started/#prepare-your-docker-environment) (Community Edition is fine)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Bash (Optional, WSL is fine.)
- Add `export uid=${UID}` to the end of your ~/.bashrc

The `uid=${UID}` environment variable is required because if the user that _creates_ the container has a different uid than the gsc user _inside_ the container, permission issues may occur within the `server_files` folder.

## Running / Development

- Clone this repo.
- `cd` into the directory of the game server you want to deploy.
- Run `docker-compose up` from a terminal.

### File & Folder Conventions

Game Server Containers is a convention-over-configuration project. Each game server is configured _the same_ to maintain consistancy, quality, and to make it easy for new users and contributors to understand.
