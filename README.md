# Application for Geo Location IP Docker image running on Alpine Linux

[![Docker Automated build](https://img.shields.io/docker/automated/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)
[![Docker Pulls](https://img.shields.io/docker/pulls/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)
[![Docker Stars](https://img.shields.io/docker/stars/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.13.5-green.svg?style=for-the-badge)](https://alpinelinux.org/)

The Docker images [(maurosoft1973/alpine-maxmind-geolite)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/) is based on the minimal [Alpine Linux](https://alpinelinux.org/).

##### Alpine Version 3.13.5 (Released Apr 14, 2021)
##### MaxMind GeoLite 2 Version 20210511

## Description
This image contains small rest application, write in go, for ip address geo location in json format.

For call the service:
http://{CONTAINER_IP_ADDRESS}:3001/{IP} (Format XXX.XXX.XXX.XXX)

## Architectures

* ```:amd64```, ```:x86_64``` - 64 bit Intel/AMD (x86_64/amd64)

## Tags

* ```:latest``` latest branch based (Automatic Architecture Selection)
* ```:amd64```, ```:x86_64```  amd64 based on latest tag but amd64 architecture

## Layers & Sizes

![Version](https://img.shields.io/badge/version-amd64-blue.svg?style=for-the-badge)
![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite?style=for-the-badge)

## Environment Variables:

### Main Build Tools parameters:
* `LC_ALL`: default locale (en_GB.UTF-8)
* `TIMEZONE`: default timezone (Europe/Brussels)

***
###### Last Update 10.05.2021 23:12:31
