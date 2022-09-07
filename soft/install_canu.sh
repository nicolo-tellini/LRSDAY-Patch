#!/bin/bash

LRSDAY_HOME=$(pwd)
CANU_VERSION=$1
CANU_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

canu_dir="${build_dir}/canu-${CANU_VERSION}/bin"
if [ -z $(check_installed ${canu_dir}) ]; then
    cd ${build_dir}
    echo "Download Canu-v${CANU_VERSION}"
    download_and_extract ${CANU_DOWNLOAD_URL} "canu-${CANU_VERSION}.tar.xz"
    cd ${canu_dir}
    ln -s ${minimap2_dir}/minimap2 .
    note_installed ${canu_dir}
fi

cd ${LRSDAY_HOME}

echo "export canu_dir=${canu_dir}" >> env.sh

echo "CANU DONE!"
