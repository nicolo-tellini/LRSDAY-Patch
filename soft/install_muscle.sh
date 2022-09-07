#!/bin/bash

LRSDAY_HOME=$(pwd)
MUSCLE_VERSION=$1
MUSCLE_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

muscle_dir="${build_dir}/muscle-${MUSCLE_VERSION}"
if [ -z $(check_installed ${muscle_dir}) ]; then
    cd ${build_dir}
    echo "Download MUSCLE-v${MUSCLE_VERSION}"
    download_and_extract ${MUSCLE_DOWNLOAD_URL} "muscle-${MUSCLE_VERSION}_i86linux64.tar.gz"
    mkdir muscle-${MUSCLE_VERSION}
    mv muscle${MUSCLE_VERSION}_i86linux64 ./muscle-${MUSCLE_VERSION}/muscle
    note_installed ${muscle_dir}
fi

cd ${LRSDAY_HOME}

echo "export muscle_dir=${muscle_dir}" >> env.sh

echo "MUSCLE DONE!"
