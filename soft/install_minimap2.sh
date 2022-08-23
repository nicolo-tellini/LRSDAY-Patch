#!/bin/bash

LRSDAY_HOME=$(pwd)
MINIMAP2_VERSION=$1
MINIMAP2_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

minimap2_dir="${build_dir}/minimap2-${MINIMAP2_VERSION}_x64-linux"
if [ -z $(check_installed ${minimap2_dir}) ]; then
    cd ${build_dir}
    echo "Download minimap2-v${MINIMAP2_VERSION}"
    download_and_extract ${MINIMAP2_DOWNLOAD_URL} "minimap2-${MINIMAP2_VERSION}.tar.bz2"
    note_installed ${minimap2_dir}
fi
PATH=${minimap2_dir}:${PATH}

cd ${LRSDAY_HOME}

echo "export minimap2_dir=${minimap2_dir}" >> env.sh

echo "MINIMAP2 DONE!"
