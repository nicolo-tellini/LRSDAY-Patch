#!/bin/bash

LRSDAY_HOME=$(pwd)
PICARD_VERSION=$1
PICARD_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

picard_dir="${build_dir}/Picard-v${PICARD_VERSION}"
if [ -z $(check_installed ${picard_dir}) ]; then
    cd ${build_dir}
    echo "Download Picard-v${PICARD_VERSION}"
    download ${PICARD_DOWNLOAD_URL} "picard.jar"
    mkdir Picard-v${PICARD_VERSION}

    mv picard.jar ${picard_dir}
    cd ${picard_dir}
    chmod 755 picard.jar
    note_installed ${picard_dir}
fi

cd ${LRSDAY_HOME}

echo "export picard_dir=${picard_dir}" >> env.sh

echo "PICARD DONE!"
