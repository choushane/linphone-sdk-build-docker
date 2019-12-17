#!/bin/sh
CreateName="2019/12/17"
MAINTAINER="Shane Chou"
NOWDATE=`date +"%Y%m%d"`
SET_VER=0.0.1
SET_PATH=$(pwd)

srv01=linphone_sdk

bulid_docker(){
    create_yml
    docker-compose -f docker-compose.yml up -d
}

kill_all(){
    stop_kill
	docker rm -f ${srv01}
	docker rmi ${srv01}-img:${SET_VER}
}

stop_kill(){
    	docker rm -f ${srv01}
}

##############  Bulid RUN All #####################
all_run(){
    stop_kill
    bulid_docker
}
############## Bulid RUN All  END ############


create_yml(){
    echo "
version: '2'
services:

  ${srv01}:
    build: "${SET_PATH}"
    image: "${srv01}-img:${SET_VER}"
    container_name: ${srv01}
    privileged: true
    networks:
        - lcs_vlan
    volumes:
        - "${SET_PATH}/source:/home/workspace"
    ports:
        - '2222:22'
    command: './entrypoint.sh'

networks:
  lcs_vlan:
" > docker-compose.yml
}
