# ReadyMedia (aka MiniDLNA) Docker container for Raspberry PI

This project builds a Raspberry PI Docker container embedding a ReadyMedia server (DLNA compliant).
This container allows you to share media files over a network using DLNA protocol.

## Build instructions

[Install Docker](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi) on a Raspberry PI host.

Build a Docker image using this command:

    $ make

A Docker image named 'rpi-readymedia' is now available.
Create a new Docker container from this image:

    $ sudo docker create --name rpi-readymedia --restart always -v $PWD/media:/data/media --net=host -p 8200:8200 -p 1900:1900/udp rpi-readymedia

You are now ready to start this container:

    $ sudo docker start rpi-readymedia

Media files are found in the Docker directory <code>/data/media</code>.
Tweak the command line argument <code>-v /your/local/dir:/data/media</code> to set a specific directory.

## Copyright

This program is a free software published under GPL.
Copyright (c) 2017 Alexandre Roman.

