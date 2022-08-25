#!/bin/bash

LRSDAY_HOME=$(pwd)
PRODIGAL_VERSION=$1
PRODIGAL_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

prodigal_dir="${build_dir}/Prodigal-${PRODIGAL_VERSION}"
if [ -z $(check_installed ${prodigal_dir}) ]; then
    cd ${build_dir}
    echo "Download Prodigal-v${PRODIGAL_VERSION}"
    download_and_extract ${PRODIGAL_DOWNLOAD_URL} "v${PRODIGAL_VERSION}.tar.gz"
    cd ${prodigal_dir}
    make -j ${MAKE_JOBS}
    note_installed ${prodigal_dir}
fi

cd ${LRSDAY_HOME}

echo "export prodigal_dir=${prodigal_dir}" >> env.sh

echo "PRODIGAL DONE!"
