#!/bin/bash

set -ex

stage=$1

if [[ -n "$stage" ]]; then
    rm -rf layer
    mkdir layer
    pushd layer
    curl -O https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
    tar xf ffmpeg-git-amd64-static.tar.xz
    rm ffmpeg-git-amd64-static.tar.xz
    mv ffmpeg-git-*-amd64-static ffmpeg
    popd
    sls deploy --$stage
else
    echo "argument error"
fi

