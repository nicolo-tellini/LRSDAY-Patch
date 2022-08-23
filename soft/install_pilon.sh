#!/bin/bash

LRSDAY_HOME=$(pwd)
PILON_VERSION=$1
PILON_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

pilon_dir="${build_dir}/Pilon-v${PILON_VERSION}"
if [ -z $(check_installed ${pilon_dir}) ]; then
    cd ${build_dir}
    echo "Download Pilon-v${PILON_VERSION}"
    download ${PILON_DOWNLOAD_URL} "pilon-${PILON_VERSION}.jar"
    mkdir Pilon-v${PILON_VERSION}
    mv pilon-${PILON_VERSION}.jar ${pilon_dir}/pilon.jar
    cd ${pilon_dir}
    chmod 755 pilon.jar
    note_installed ${pilon_dir}
fi

cd ${LRSDAY_HOME}

echo "export pilon_dir=${pilon_dir}" >> env.sh

echo "PILON DONE!"
