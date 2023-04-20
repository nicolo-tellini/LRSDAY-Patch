#!/bin/bash

LRSDAY_HOME=$(pwd)
AUGUSTUS_VERSION=$1
AUGUSTUS_DOWNLOAD_URL=$2
BAMTOOLS_VERSION=$3

source ${LRSDAY_HOME}/soft/common.sh

augustus_dir="${build_dir}/augustus-${AUGUSTUS_VERSION}/bin"
if [ -z $(check_installed ${augustus_dir}) ]; then
    cd ${build_dir}
    echo "Download Augustus-v${AUGUSTUS_VERSION}"
    download_and_extract ${AUGUSTUS_DOWNLOAD_URL} "augustus-${AUGUSTUS_VERSION}.tar.gz"
    cd ${build_dir}/augustus-${AUGUSTUS_VERSION}/auxprogs/bam2hints/
    cp $LRSDAY_HOME/misc/bam2hints.Makefile Makefile
    cd ${build_dir}/augustus-${AUGUSTUS_VERSION}/auxprogs/filterBam/src/
    cp ${LRSDAY_HOME}/misc/filterBam.Makefile Makefile
    cd ${build_dir}/augustus-${AUGUSTUS_VERSION}
    make -j ${MAKE_JOBS} BAMTOOLS="${build_dir}/bamtools-${BAMTOOLS_VERSION}"
    note_installed ${augustus_dir}
fi
export AUGUSTUS_CONFIG_PATH="${build_dir}/augustus-${AUGUSTUS_VERSION}/config"

cd ${LRSDAY_HOME}

echo "export augustus_dir=${augustus_dir}" >> env.sh

echo "AUGUSTUS DONE!"
