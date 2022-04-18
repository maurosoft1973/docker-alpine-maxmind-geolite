# Application for Geo Location IP Docker image running on Alpine Linux

[![Docker Automated build](https://img.shields.io/docker/automated/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)
[![Docker Pulls](https://img.shields.io/docker/pulls/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)
[![Docker Stars](https://img.shields.io/docker/stars/maurosoft1973/alpine-maxmind-geolite.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.15.4-green.svg?style=for-the-badge)](https://alpinelinux.org/)

The Docker images [(maurosoft1973/alpine-maxmind-geolite)](https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/) is based on the minimal [Alpine Linux](https://alpinelinux.org/).

##### Alpine Version 3.15.4 (Released Apr 04 2022)
##### MaxMind GeoLite 2 Version 20220412

## Description
This image contains small rest application, write in go, for ip address geo location in json format.

For call the service:
http://{CONTAINER_IP_ADDRESS}:3001/{IP} (Format XXX.XXX.XXX.XXX)

## Architectures

* ```:aarch64``` - 64 bit ARM
* ```:armhf```   - 32 bit ARM v6
* ```:armv7```   - 32 bit ARM v7
* ```:ppc64le``` - 64 bit PowerPC
* ```:x86```     - 32 bit Intel/AMD
* ```:x86_64```  - 64 bit Intel/AMD (x86_64/amd64)

## Tags

* ```:latest```         latest branch based (Automatic Architecture Selection)
* ```:aarch64```        latest 64 bit ARM
* ```:armhf```          latest 32 bit ARM v6
* ```:armv7```          latest 32 bit ARM v7
* ```:ppc64le```        latest 64 bit PowerPC
* ```:x86```            latest 32 bit Intel/AMD
* ```:x86_64```         latest 64 bit Intel/AMD
* ```:test```           test branch based (Automatic Architecture Selection)
* ```:test-aarch64```   test 64 bit ARM
* ```:test-armhf```     test 32 bit ARM v6
* ```:test-armv7```     test 32 bit ARM v7
* ```:test-ppc64le```   test 64 bit PowerPC
* ```:test-x86```       test 32 bit Intel/AMD
* ```:test-x86_64```    test 64 bit Intel/AMD
* ```:3.15.4``` 3.15.4 branch based (Automatic Architecture Selection)
* ```:3.15.4-aarch64```   3.15.4 64 bit ARM
* ```:3.15.4-armhf```     3.15.4 32 bit ARM v6
* ```:3.15.4-armv7```     3.15.4 32 bit ARM v7
* ```:3.15.4-ppc64le```   3.15.4 64 bit PowerPC
* ```:3.15.4-x86```       3.15.4 32 bit Intel/AMD
* ```:3.15.4-x86_64```    3.15.4 64 bit Intel/AMD
* ```:3.15.4-20220412``` 3.15.4-20220412 branch based (Automatic Architecture Selection)
* ```:3.15.4-20220412-aarch64```   3.15.4 64 bit ARM
* ```:3.15.4-20220412-armhf```     3.15.4 32 bit ARM v6
* ```:3.15.4-20220412-armv7```     3.15.4 32 bit ARM v7
* ```:3.15.4-20220412-ppc64le```   3.15.4 64 bit PowerPC
* ```:3.15.4-20220412-x86```       3.15.4 32 bit Intel/AMD
* ```:3.15.4-20220412-x86_64```    3.15.4 64 bit Intel/AMD

## Layers & Sizes

| Version                                                                               | Size                                                                                                                 |
|---------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| ![Version](https://img.shields.io/badge/version-amd64-blue.svg?style=for-the-badge)   | ![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite/latest?style=for-the-badge)  |
| ![Version](https://img.shields.io/badge/version-armv6-blue.svg?style=for-the-badge)   | ![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite/armhf?style=for-the-badge)   |
| ![Version](https://img.shields.io/badge/version-armv7-blue.svg?style=for-the-badge)   | ![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite/armv7?style=for-the-badge)   |
| ![Version](https://img.shields.io/badge/version-ppc64le-blue.svg?style=for-the-badge) | ![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite/ppc64le?style=for-the-badge) |
| ![Version](https://img.shields.io/badge/version-x86-blue.svg?style=for-the-badge)     | ![MicroBadger Size (tag)](https://img.shields.io/docker/image-size/maurosoft1973/alpine-maxmind-geolite/x86?style=for-the-badge)     |

## Environment Variables:

### Main MaxMind GeoLite 2 parameters:
* `LC_ALL`: set locale (default en_GB.UTF-8)
* `TIMEZONE`: set timezone (default Europe/Brussels)
* `LISTEN_PORT`: set listen port (default 3001)

#### List of locale Sets

When setting locale `LC_ALL`, also make sure to choose a locale otherwise it will be the default (en_GB.UTF-8).

```
+-----------------+
| Locale          |
+-----------------+
| fr_CH.UTF-8     |
| fr_FR.UTF-8     |
| de_CH.UTF-8     |
| de_DE.UTF-8     |
| en_GB.UTF-8     |
| en_US.UTF-8     |
| es_ES.UTF-8     |
| it_CH.UTF-8     |
| it_IT.UTF-8     |
| nb_NO.UTF-8     |
| nl_NL.UTF-8     |
| pt_PT.UTF-8     |
| pt_BR.UTF-8     |
| ru_RU.UTF-8     |
| sv_SE.UTF-8     |
+-----------------+
```

***
###### Last Update 18.04.2022 11:40:07
