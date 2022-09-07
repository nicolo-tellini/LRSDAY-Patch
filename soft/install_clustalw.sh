#!/bin/bash

LRSDAY_HOME=$(pwd)
CLUSTALW_VERSION=$1
CLUSTALW_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

clustalw_dir="${build_dir}/clustalw-${CLUSTALW_VERSION}/bin"
if [ -z $(check_installed ${clustalw_dir}) ]; then
    cd ${build_dir}
    echo "Download ClustalW-v${CLUSTALW_VERSION}"
    download_and_extract ${CLUSTALW_DOWNLOAD_URL} "clustalw-${CLUSTALW_VERSION}.tar.gz"
    cd clustalw-${CLUSTALW_VERSION}
    ./configure --prefix="${build_dir}/clustalw-${CLUSTALW_VERSION}"
    make -j $MAKE_JOBS
    make install
    note_installed ${clustalw_dir}
fi

cd ${LRSDAY_HOME}

echo "export clustalw_dir=${clustalw_dir}" >> env.sh

echo "CLUSTALW DONE!"
