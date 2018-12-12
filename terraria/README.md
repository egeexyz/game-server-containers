# gsc-terraria - a Game Server Container for Terraria

<a href="www.egee.io"><img src="https://i.imgur.com/Mvjrkqo.png" alt="terraria on Docker" width="300" /></a>

[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/4EMbcgR8)

Host your own dedicated game server with one command:

`docker-compose up`

That's right - this single command will create your very own dedicated game server! And its fully cross-platform; run it on Linux _or_ Windows. That's the power of Game Server Containers!

Note - this readme is generic and applies to all of the Game Server Containers. Check out the <a href="https://github.com/egee-irl/gsc-terraria/wiki">Wiki</a> for information specific to _this_ particular game server.

## Getting Started

To get started, you'll need to install the Docker-Engine (v1.10.0+) & Docker-Compose (v1.17.0+).

### Windows

Docker supports Windows 10 Professional/Enterprise, and Windows Server 2016+. Docker does _not_ support Windows 10 Home or Windows 7/8. Docker also <a href="https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install">requires</a> HyperV enabled.

You can download and install Docker & Docker-Compose as one package from the <a href="https://docs.docker.com/compose/install/#install-compose">Docker website</a> or install Docker using <a href="https://chocolatey.org/packages/docker">Chocolatey</a>. Keep in mind that installing Docker from the website or from Chocolatey requires elevated Powershell permissions.

### Linux

Docker-Compose is available in nearly every distribution repository and typically installs all the required packages as dependencies. Using Debian/Ubuntu as an example, a typical install command would look something like this:

`sudo apt install -y docker-compose`

Once Docker is installed, you will need to enable and start the Docker daemon:

`sudo systemctl enable docker.service && sudo systemctl start docker.service`

Finally, it is handy to add your user to the Docker group, unless you enjoy running `sudo` for each Docker command:

`sudo groupadd docker && sudo usermod -aG docker $USER`

See the <a href="https://github.com/egee-irl/gsc-terraria/wiki">Wiki</a> for more information about configuration for this Game Server Container.

## Running The Dedicated Server

Once you've installed Docker & Docker-Compose, you are _pretty much_ ready to run your server. However, before you dive into the deep side of the pool, there are a few things to consider.

### Considerations

1. Dedicated servers in general require a _decent_ amount of computing power. If your machine doesn't meet the requirements for running a dedicated server, don't even try it; you may lock up and or crash your computer.

2. Docker is largely designed for head-less operation. As such, if you launch a dedicated server and then close the window or lose track of it, you may forget that you have a dedicated server running & eating up resources in the background.

3. Docker images tend to be large. The resulting image for the dedicated server could (probably) be larger than 2gb.

4. Docker containers should be thought of as ephemeral; avoid or backup any important player or configuration data in your container.

### Configuring The Server

Game Server Containers are designed to be _almost_-zero-config; you only need to edit the game server config files in the `cfg` directory. You can also update the container resource usage or mount volumes by editing the `docker-compose.yml`. The actual `Dockerfile` itself should not be edited unless you know what you are doing.

### Building & Running The Server

Once you've got the prerequisites installed, open a terminal window in the repository directory, and run:

`docker-compose up`

Docker should begin reporting the status of the container into your terminal as it is built. It will take about a minute or three to build the container, depending on your CPU & network speed.

Once Docker is finished building the container, it will automatically run and attach itself to it. If you don't want to keep a terminal window open for the server, you can run Docker-Compose with the -d parameter:

`docker-compose up -d`

### Updating The Server

Because Docker containers are somewhat ephemeral, updating them can be touchy. There is an update utility which is used to update the _game data_. You can run the utility for a game server by doing `docker exec container_name update`. You get can the container name by running `docker ps` in the `NAMES` column.

Updating non-game data is another story. If you are comfortable with Docker & Linux, you can access the container like this `docker exec -it container_name bash`. Once inside the container, use `nano` to update your files.

### Viewing Logs

Because the server logs reside inside the container itself, the container is configured to output _everything_ from the server logs to stdout. You can output the server logs to your terminal by running:

`docker-compose logs`

If you have more than one server running, you will get logs for _all_ of the servers. You can specify which server to pull logs from by passing the container name as a parameter:

`docker-compose logs container_name`

If you want to output the logs to a file, you will want to use the regular `docker logs` command because `docker-compose logs` adds color and formating which does not translate well into actual log files:

`docker logs container_name > my.log`

Automatic log rotation is not supported because it is outside the scope of what the Game Server Containers do. Some games support automatic log rotation out of the box but you will need to copy the logs out of the container to access them. If a game server does not support automatic log rotation and you want to archive your log files, you will need to set it up yourself.

## FAQ

Lots of questions, including technical issues, come up and this section aims to address them!

#### ERROR: Version in "./docker-compose.yml" is unsupported.

This error is probably the most common error folks run into (especially on Ubuntu!). It simply means you aren't running the latest version of Docker-Compose. Version 1.17+ (Compose file 2.3) is needed for CPU scaling. You can remedy this error by upgrading to the latest version of Docker-Compose, or commenting out the `cpus` attribute in the `docker-compose.yml` file.

#### The server is super laggy or runs really slow!

By default, the game server container is only allowed to use _up to_ 80% of the total available CPU, and _only_ 2GB of ram. You can easily adjust these contraints by editing the `docker-compose.yml` file yourself. Use <a href="https://docs.docker.com/compose/compose-file/compose-file-v2/#cpu-and-other-resources">this</a> as a reference while doing so.

#### How do I change/update game configuration files on a server already running?

Short answer: you create a _new_ server. This may seem odd at first but Docker containers are more or less designed to be immutable and changing configuration data on the fly can yield unexpected results.

However if you _really_ want to change or update something on your server, use `docker exec -it container_name bash` to access the container and then change whatever you need to from there. Remember to restart the server after you've made your changes `docker restart container_name`

#### How do I backup game data?

Currently there is no "official way" to backup game data. Unofficially, there are a two options:

1. Create <a href="https://docs.docker.com/compose/compose-file/compose-file-v2/#volumes-volume_driver">Docker volumes</a> between the Host and Container using the docker-compose file.
1. Use <a href="https://stackoverflow.com/questions/22049212/copying-files-from-docker-container-to-host">docker cp</a> to copy files/folders to and from the Host and Container.

Creating a volume _sounds_ like the easy route but volumes on Docker can be tricky to new-comers, and volume implementation differs based on the host (Linux vs Windows, etc).

The `docker cp` command is pretty straight forward and I recommend it if you really need to back up a file or folder.

#### Why aren't Docker volumes setup by default?

Because their implementation depends on the host platform. There are obvious differences between Windows and Linux, but there are also differences in how volumes are mounted between Linux distributions such as Ubuntu and Fedora (AppArmor vs SELinux).

Feel free to submit a PR if you know a way to make volumes mount seamlessly without configuration between platforms.

#### How do I save configuration data between servers/wipes?

If you plan on using Game Server Containers to regularly host your dedicated game servers, I recommend forking this repository and checking your game configuration into your forked repo. Another option is to save your server configuration as a <a href="https://gist.github.com/">gist</a> and curl/download it whenever you need it.

#### Why use Docker instead of other solutions (LGSM)?

Docker & Docker-Compose provide an easy, cross-platform, and almost-zero-config way of creating, deploying, and running applications. Docker is also guaranteed to be cross-platform so there's no time spent considering if an application will run the same across different platforms. Docker containers also allow for resource management and the Docker-Compose file makes it super easy to allocate cpu cycles or memory to a given container based on the needs of the admin.

The code that powers Game Server Containers is minimal which makes it extremely easy to maintain. And all containers are linted and built as part of a CI process. Furthermore, all Game Server Containers follow the same convention so if you are familiar with one Game Server Container, you are familiar with all of them.
