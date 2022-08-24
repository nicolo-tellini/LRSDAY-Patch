#!/bin/bash

LRSDAY_HOME=$(pwd)
GUPPY_VERSION=$1
GUPPY_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

guppy_dir="${build_dir}/ont-guppy-cpu/bin"
if [ -z $(check_installed ${guppy_dir}) ]; then
    cd ${build_dir}
    echo "Download Guppy-v${GUPPY_VERSION}"
    download_and_extract ${GUPPY_DOWNLOAD_URL} "ont-guppy-cpu_${GUPPY_VERSION}_linux64.tar.gz"
    note_installed ${guppy_dir}
fi

cd ${LRSDAY_HOME}

echo "export guppy_dir=${guppy_dir}" >> env.sh

echo "GUPPY DONE!"
