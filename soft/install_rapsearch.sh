#!/bin/bash

LRSDAY_HOME=$(pwd)
RAPSEARCH_VERSION=$1
RAPSEARCH_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

rapsearch_dir="${build_dir}/RAPSearch${RAPSEARCH_VERSION}_64bits/bin"
if [ -z $(check_installed ${rapsearch_dir}) ]; then
    cd ${build_dir}
    echo "Download RAPsearch-v${RAPSEARCH_VERSION}"
    download_and_extract ${RAPSEARCH_DOWNLOAD_URL} "RAPSearch${RAPSEARCH_VERSION}_64bits.tar.gz"
    note_installed ${rapsearch_dir}
fi

cd ${LRSDAY_HOME}

echo "export rapsearch_dir=${rapsearch_dir}" >> env.sh

echo "RAPSEARCH2 DONE!"
