#!/bin/bash

LRSDAY_HOME=$(pwd)
HMMER_VERSION=$1
HMMER_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

hmmer_root="${build_dir}/hmmer-${HMMER_VERSION}"
hmmer_dir="${build_dir}/hmmer-${HMMER_VERSION}/bin"
if [ -z $(check_installed ${hmmer_dir}) ]; then
    cd ${build_dir}
    echo "Download hmmer-v${HMMER_VERSION}"
    download_and_extract ${HMMER_DOWNLOAD_URL} "hmmer-${HMMER_VERSION}-linux-intel-x86_64.tar.gz"
    cd ${hmmer_root}
    ./configure --prefix=${hmmer_root}
    make -j ${MAKE_JOBS}
    make install
    cd easel
    make install
    note_installed ${hmmer_dir}
fi

cd ${LRSDAY_HOME}

echo "export hmmer_dir=${hmmer_dir}" >> env.sh

echo "HMMER DONE!"
