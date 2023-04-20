#!/bin/bash

LRSDAY_HOME=$(pwd)
EMBOSS_VERSION=$1
EMBOSS_VERSION_prefix=$2
EMBOSS_DOWNLOAD_URL=$3

source ${LRSDAY_HOME}/soft/common.sh

emboss_dir="${build_dir}/EMBOSS-${EMBOSS_VERSION}/emboss"
if [ -z $(check_installed ${emboss_dir}) ]; then
    cd ${build_dir}
    echo "Download EMBOSS"
    download_and_extract ${EMBOSS_DOWNLOAD_URL} "emboss_v${EMBOSS_VERSION}.tar.gz"
    cd EMBOSS-${EMBOSS_VERSION}
    ./configure --without-x
    make -j ${MAKE_JOBS}
    note_installed ${emboss_dir}
fi

cd ${LRSDAY_HOME}

echo "export emboss_dir=${emboss_dir}" >> env.sh

echo "EMBOSS DONE!"
