# gsc-rust - Game Server Container for Rust
<a href="www.egee.io"><img src="https://i.imgur.com/Mvjrkqo.png" alt="Rust on Docker" width="300" /></a>

[![Build Status](https://travis-ci.org/egee-irl/gsc-rust.svg?branch=unstable)](https://travis-ci.org/egee-irl/gsc-rust)
[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/42PMX5N)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://github.com/egee-irl/gsc-rust/blob/stable/LICENSE)

Host your very own dedicated Rust server with one command:

``docker-compose up``

That's it! And its fully cross-platform; run it on Linux *or* Windows. That's the power of Game Server Containers!

**Note** - this readme assumes you've already installed the prerequisites & your system meets the requirements to run a Game Server Container. If you want to learn more and see what it takes to run your own Game Server Container, check out the <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo.

### Starting The Server

Rust is one of the easiest games to serve in a container. Launch parameters are defined in the ``vars.env`` file, and additional server configuration settings can be found inthe ``server.cfg`` file in the ``rust/cfg`` directory in this repo.

Hosting your own dedicated server is ridiculously easy:

1. Clone this repo
2. Run ``docker-compose up`` from a terminal in the repo directory

Docker should begin downloading the base ``rustserver`` image and then begin building the container. Once the container is built, it will automatically run and launch your server. If you don't want the server attached to your terminal window, you can safely kill the process (ctrl-c), and restart it detached from your terminal: ``docker-compose up -d``. If the server is detached from your terminal, you can use the ``docker-compose logs`` command, or view the log directly (located at ``rust/server.log``).

### Configuring The Server

There are 3 config files you may want to change before making your game server public. The config files are:

<a href="https://github.com/egee-irl/gsc-rust/wiki/vars.env">vars.env</a> - This file defines the launch parameters for the Rust server.

<a href="https://github.com/egee-irl/gsc-rust/wiki/server.cfg">server.cfg</a> - This is the main config file for the whole server. Almost much everything you'll want to do to set the server up will be found here.

<a href="https://github.com/egee-irl/gsc-rust/wiki/users.cfg">users.cfg</a> - If you have folks you want to be persistent admins of your server, set them in this file so that they are active admins when the server starts up.

<a href="https://github.com/egee-irl/gsc-rust/wiki/bans.cfg">ban.cfg</a> - If there's some asshat you never want joining your server, set them in this file so the ban is active as soon as the server starts.

<a href="https://github.com/egee-irl/gsc-rust/wiki/server.log">server.log</a> - Not a config file but an equally important file that stores all the server activity.

If you want to change the server's configuration after you've launched it, you can find the config files in the ``cfg`` directory located where your volumes are mounted. See the <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo for more information about volumes.

### Updating The Server

Rust follows a pretty regular update & wipe schedule. A minor update occurs every Thursday, and a major update & map wipe happens every _first_ Thursday of the month. All updates require rebooting of the server, and the wipe update will restart all map data and sometimes player data (blueprints, etc).

Updating the server is super easy:

``docker-compose exec rust-server update``

<u>Always</u> make sure you are in the repo directory when issuing Docker-Compose commands.

### Server Data Location
The Rust server container mounts the server data folder as a volume under a folder titled ``rust`` in the root of this repository. All files related to server configuration can be found there and are safe to edit.

### Considerations

Because Game Server Containers are designed to be as close to zero-configuration as possible, configuration was sacrificed for convention and stability. This _shouldn't_ mean anything to the end user, however if you are interested in poking around at the Dockerfile and other configuration bits, there are things to be aware of:

#### Server Configuration
The default server configuration is not designed for a public server. And while you _can_ host a public server with the default values (for testing your network settings or something), you will want to change them. Check the <a href="https://github.com/egee-irl/gsc-rust/wiki">wiki</a> for more information.

#### Back Ups
GSC simply launches your game server in a convenient container; it does **not** manage it for you. General server admin-y things such as rotating log files and backing up server data is your responsiblity. See tthe <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo for more information about what GSC does and does not do.

#### Resource Allocation
By default, the Rust server will use 2 cores and 3gb of ram. These values are static and set in the ``docker-compose.yml`` file. If you want your server to use more ram or more cores, adjust them there. There's a section in the <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo about this.

#### Help and Examples
If you are stuck and or can't figure out how to setup your own Rust server, checkout the <a href="https://github.com/egee-irl/gsc-rust/tree/egeeio">egeeio branch</a> in this repo. The egee.io community hosts our own Rust server and all the server configuration is checked into that branch and you are free to use it as a template.
