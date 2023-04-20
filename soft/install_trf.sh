#!/bin/bash

LRSDAY_HOME=$(pwd)
TRF_VERSION=$1
TRF_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh
repeatmasker_dir=${LRSDAY_HOME}/build/RepeatMasker
trf_dir=${LRSDAY_HOME}/build/RepeatMasker
if [ ! -e "${repeatmasker_dir}/trf" ]; then
    cd ${repeatmasker_dir}
    echo "Download TRF-v${TRF_VERSION}"
    download ${TRF_DOWNLOAD_URL} "trf${TRF_VERSION}.linux64"
    mv trf${TRF_VERSION}.linux64 trf
    chmod 755 trf
fi

cd ${LRSDAY_HOME}

echo "export trf_dir=${trf_dir}" >> env.sh

echo "TRF DONE!"
