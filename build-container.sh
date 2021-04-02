#!/bin/bash
# Description: Script for alpine maxmind geolite container
# Maintainer: Mauro Cardillo
#
echo "Get Remote Environment Variable"
wget -q "https://gitlab.com/maurosoft1973-docker/alpine-variable/-/raw/master/.env" -O ./.env
source ./.env

echo "Get Remote Settings"
wget -q "https://gitlab.com/maurosoft1973-docker/alpine-variable/-/raw/master/settings.sh" -O ./settings.sh
chmod +x ./settings.sh
source ./settings.sh

# Default values of arguments
IMAGE=maurosoft1973/alpine-maxmind-geolite
IMAGE_TAG=latest
CONTAINER=alpine-maxmind-geolite
LC_ALL=it_IT.UTF-8
TIMEZONE=Europe/Rome
LISTEN_IP=0.0.0.0
LISTEN_PORT=3001

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -it=*|--image-tag=*)
        IMAGE_TAG="${arg#*=}"
        shift # Remove
        ;;
        -cn=*|--container=*)
        CONTAINER="${arg#*=}"
        shift # Remove
        ;;
        -cl=*|--lc_all=*)
        LC_ALL="${arg#*=}"
        shift # Remove
        ;;
        -ct=*|--timezone=*)
        TIMEZONE="${arg#*=}"
        shift # Remove
        ;;
        -li=*|--listen_ip=*)
        LISTEN_IP="${arg#*=}"
        shift # Remove
        ;;
        -lp=*|--listen_port=*)
        LISTEN_PORT="${arg#*=}"
        shift # Remove
        ;;
        -h|--help)
        echo -e "usage "
        echo -e "$0 "
        echo -e "  -it=|--image-tag -> ${IMAGE}:${IMAGE_TAG} (image with tag)"
        echo -e "  -cn=|--container -> ${CONTAINER} (container name)"
        echo -e "  -cl=|--lc_all -> ${LC_ALL} (container locale)"
        echo -e "  -ct=|--timezone -> ${TIMEZONE} (container timezone)"
        echo -e "  -li=|--listen_ip -> ${LISTEN_IP} (listen ip)"
        echo -e "  -lp=|--listen_port -> ${LISTEN_PORT} (listen port)"
        exit 0
        ;;
    esac
done

echo "# Image                   : ${IMAGE}:${IMAGE_TAG}"
echo "# Container Name          : ${CONTAINER}"
echo "# Container Locale        : ${LC_ALL}"
echo "# Container Timezone      : ${TIMEZONE}"

echo -e "Check if container ${CONTAINER} exist"
CHECK=$(docker container ps -a | grep ${CONTAINER} | wc -l)
if [ ${CHECK} == 1 ]; then
    echo -e "Stop Container -> ${CONTAINER}"
    docker stop ${CONTAINER} > /dev/null

    echo -e "Remove Container -> ${CONTAINER}"
    docker container rm ${CONTAINER} > /dev/null
else 
    echo -e "The container ${CONTAINER} not exist"
fi

echo -e "Create and run container"
docker run -dit --name ${CONTAINER} -p ${LISTEN_IP}:${LISTEN_PORT}:3001 -e LC_ALL=${LC_ALL} -e TIMEZONE=${TIMEZONE} ${IMAGE}:${IMAGE_TAG}

echo -e "Sleep 5 second"
sleep 5

IP=$(docker exec -it ${CONTAINER} /sbin/ip route | grep "src" | awk '{print $7}')
echo -e "IP Address is: ${IP}";

echo -e ""
echo -e "Environment variable";
docker exec -it ${CONTAINER} env

echo -e ""
echo -e "Container Logs"
docker logs ${CONTAINER}

rm -rf ./.env
rm -rf ./settings.sh
