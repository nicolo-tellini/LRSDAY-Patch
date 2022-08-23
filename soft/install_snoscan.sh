#!/bin/bash

LRSDAY_HOME=$(pwd)
SNOSCAN_VERSION=$1
SNOSCAN_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

snoscan_dir="${build_dir}/snoscan-${SNOSCAN_VERSION}"
if [ -z $(check_installed ${snoscan_dir}) ]; then
    cd ${build_dir}
    echo "Download snoscan-v${SNOSCAN_VERSION}"
    download_and_extract ${SNOSCAN_DOWNLOAD_URL} "snoscan-${SNOSCAN_VERSION}.tar.gz"
    cd ${snoscan_dir}
    cd squid-1.5.11
    rm *.o
    make -j ${MAKE_JOBS}
    cd ..
    cp ${LRSDAY_HOME}/misc/snoscan.Makefile Makefile
    rm *.o
    make -j ${MAKE_JOBS}
    note_installed ${snoscan_dir}
fi

cd ${LRSDAY_HOME}

echo "export snoscan_dir=${snoscan_dir}" >> env.sh

echo "SNOSCAN DONE!"
