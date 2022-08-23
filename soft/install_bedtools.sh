#!/bin/bash

LRSDAY_HOME=$(pwd)
BEDTOOLS_VERSION=$1
BEDTOOLS_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

bedtools_dir="${build_dir}/bedtools2/bin"
if [ -z $(check_installed ${bedtools_dir}) ]; then
    cd ${build_dir}
    echo "Download bedtools-v${BEDTOOLS_VERSION}"
    download_and_extract ${BEDTOOLS_DOWNLOAD_URL} "bedtools-${BEDTOOLS_VERSION}.tar.gz"
    cd "${build_dir}/bedtools2"
    make -j $MAKE_JOBS
    note_installed ${bedtools_dir}
fi

cd ${LRSDAY_HOME}

echo "export bedtools_dir=${bedtools_dir}" >> env.sh

echo "BEDTOOLS DONE!"
