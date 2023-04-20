#!/bin/bash

LRSDAY_HOME=$(pwd)
PARALLEL_VERSION=$1
PARALLEL_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

parallel_dir="${build_dir}/parallel-${PARALLEL_VERSION}/bin"
if [ -z $(check_installed ${parallel_dir}) ]; then
    cd ${build_dir}
    echo "Download parallel"
    download_and_extract $PARALLEL_DOWNLOAD_URL "parallel_v${PARALLEL_VERSION}.tar.bz2"
    cd parallel-${PARALLEL_VERSION}
    ./configure --prefix="${build_dir}/parallel-${PARALLEL_VERSION}"
    make -j $MAKE_JOBS
    make install
    parallel_dir="${build_dir}/parallel-${PARALLEL_VERSION}/bin"
    note_installed ${parallel_dir}
fi

cd ${LRSDAY_HOME}

echo "export parallel_dir=${parallel_dir}" >> env.sh

echo "PARALLEL DONE!"
