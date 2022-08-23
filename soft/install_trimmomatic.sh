#!/bin/bash

LRSDAY_HOME=$(pwd)
TRIMMOMATIC_VERSION=$1
TRIMMOMATIC_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

trimmomatic_dir="${build_dir}/Trimmomatic-${TRIMMOMATIC_VERSION}"
if [ -z $(check_installed ${trimmomatic_dir}) ]; then
    cd ${build_dir}
    echo "Download Trimmomatic-v${TRIMMOMATIC_VERSION}"
    download ${TRIMMOMATIC_DOWNLOAD_URL} "Trimmomatic-${TRIMMOMATIC_VERSION}.zip"
    unzip Trimmomatic-${TRIMMOMATIC_VERSION}.zip
    rm Trimmomatic-${TRIMMOMATIC_VERSION}.zip

    cd ${trimmomatic_dir}
    chmod 755 trimmomatic-${TRIMMOMATIC_VERSION}.jar
    ln -s trimmomatic-${TRIMMOMATIC_VERSION}.jar trimmomatic.jar 
    note_installed ${trimmomatic_dir}
fi

cd ${LRSDAY_HOME}

echo "export trimmomatic_dir=${trimmomatic_dir}" >> env.sh

echo "TRIMMOMATIC DONE!"
