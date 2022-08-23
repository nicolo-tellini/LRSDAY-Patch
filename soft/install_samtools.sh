#!/bin/bash

LRSDAY_HOME=$(pwd)
SAMTOOLS_VERSION=$1
SAMTOOLS_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

samtools_dir="${build_dir}/samtools-${SAMTOOLS_VERSION}"
htslib_dir="${samtools_dir}/htslib-${SAMTOOLS_VERSION}"
tabix_dir="${samtools_dir}/htslib-${SAMTOOLS_VERSION}"
if [ -z $(check_installed ${samtools_dir}) ]; then
    cd ${build_dir}
    echo "Download samtools-v${SAMTOOLS_VERSION}"
    download_and_extract ${SAMTOOLS_DOWNLOAD_URL} "samtools-${SAMTOOLS_VERSION}.tar.bz2"
    cd ${samtools_dir}
    C_INCLUDE_PATH=""
    ./configure --without-curses;
    make -j ${MAKE_JOBS}
    wait
    cd htslib-${SAMTOOLS_VERSION}
    ./configure --with-htslib=${htslib_dir}   
    make -j ${MAKE_JOBS}
    wait
    cd ${build_dir}
    note_installed ${samtools_dir}
fi
PATH="${samtools_dir}:${htslib_dir}:${tabix_dir}:${PATH}"

cd ${LRSDAY_HOME}

echo "export samtools_dir=${samtools_dir}" >> env.sh
echo "export htslib_dir=${htslib_dir}" >> env.sh
echo "export tabix_dir=${tabix_dir}" >> env.sh

echo "SAMTOOLS DONE!"
