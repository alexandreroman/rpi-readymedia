# ReadyMedia (aka MiniDLNA) Docker container for Raspberry PI

This project builds a Raspberry PI Docker container embedding a ReadyMedia server (DLNA compliant).
This container allows you to share media files over a network using DLNA protocol.

## Build instructions

[Install Docker](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi) on a Raspberry PI host.

Build a Docker image using this command:

    $ make

A Docker image named 'rpi-readymedia' is now available.

You may have to increase the amount of `inotify` watchers:

    $ echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
    $ sudo sysctl -p

Start a new container using this image:

    $ sudo docker run --name rpi-readymedia -d --restart always -v $PWD/media:/data/media --net=host rpi-readymedia

Media files are found in directory <code>/data/media</code> inside the container.
Tweak the command line argument <code>-v /your/local/dir:/data/media</code> to set a specific directory.

## Copyright

This program is a free software published under GPL.
Copyright (c) 2020 Alexandre Roman.
