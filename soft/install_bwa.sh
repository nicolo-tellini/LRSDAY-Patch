#!/bin/bash

LRSDAY_HOME=$(pwd)
BWA_VERSION=$1
BWA_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

bwa_dir="${build_dir}/bwa-${BWA_VERSION}"
if [ -z $(check_installed ${bwa_dir}) ]; then
    cd ${build_dir}
    echo "Download BWA-v${BWA_VERSION}"
    download_and_extract ${BWA_DOWNLOAD_URL} "bwa-${BWA_VERSION}.tar.bz2"
    cd ${bwa_dir}
    make -j ${MAKE_JOBS}
    note_installed ${bwa_dir}
fi

cd ${LRSDAY_HOME}

echo "export bwa_dir=${bwa_dir}" >> env.sh

echo "BWA DONE!"
