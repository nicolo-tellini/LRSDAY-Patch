#!/bin/bash

LRSDAY_HOME=$(pwd)
BAMTOOLS_VERSION=$1
BAMTOOLS_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

bamtools_dir="${build_dir}/bamtools-${BAMTOOLS_VERSION}/bin"
if [ -z $(check_installed ${bamtools_dir}) ]; then
    cd ${build_dir}
    echo "Download bamtools-v${BAMTOOLS_VERSION}"
    download_and_extract ${BAMTOOLS_DOWNLOAD_URL} "v${BAMTOOLS_VERSION}.tar.gz"
    cd ${build_dir}/bamtools-${BAMTOOLS_VERSION}
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="${build_dir}/bamtools-${BAMTOOLS_VERSION}" ..
    make -j ${MAKE_JOBS}
    make install
    cd ${build_dir}/bamtools-${BAMTOOLS_VERSION}
    ln -sf lib lib64
    note_installed ${bamtools_dir}
fi

cd ${LRSDAY_HOME}

echo "export bamtools_dir=${bamtools_dir}" >> env.sh

echo "BAMTOOLS DONE!"
