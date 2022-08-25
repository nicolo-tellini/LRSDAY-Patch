#!/bin/bash

LRSDAY_HOME=$(pwd)
RACON_VERSION=$1
RACON_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

racon_dir="${build_dir}/racon-v${RACON_VERSION}/build/bin"
if [ -z $(check_installed ${racon_dir}) ]; then
    cd ${build_dir}
    echo "Download racon-v${RACON_VERSION}"
    download_and_extract ${RACON_DOWNLOAD_URL} "racon-v${RACON_VERSION}.tar.gz"
    cd racon-v${RACON_VERSION}
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j ${MAKE_JOBS}
    note_installed ${racon_dir}
fi

cd ${LRSDAY_HOME}

echo "export racon_dir=${racon_dir}" >> env.sh

echo "RACON DONE!"
