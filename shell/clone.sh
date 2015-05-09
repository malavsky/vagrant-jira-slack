#!/bin/sh

PROJECT_ROOT=$1
SSH_URL=$2
HTTP_URL=$3
HTTP_USER=$4
HTTP_PASSWORD=$5

cd ${PROJECT_ROOT};

rm -rf .gitKeep

if [ ! -z "$SSH_URL" ];
then
git clone ${SSH_URL} ./
else
    if ! [ "$HTTP_URL" ];
        then echo Add link to git repo
        exit 1;
    fi
    if ! [ "$HTTP_USER" ];
        then echo Add username for git repo
        exit 1;
    fi

    if ! [ "$HTTP_PASSWORD" ];
        then echo Add password for git repo
        exit 1;
    fi

    git clone https://${HTTP_USER}:${HTTP_PASSWORD}@${HTTP_URL} ./
fi