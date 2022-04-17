#!/bin/sh

export LISTEN_IP=${LISTEN_IP:-"0.0.0.0"}
export LISTEN_PORT=${LISTEN_PORT:-"3001"}

source /scripts/init-alpine.sh

./main
