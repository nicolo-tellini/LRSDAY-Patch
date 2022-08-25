#!/bin/bash

LRSDAY_HOME=$(pwd)
WTDBG2_VERSION=$1
WTDBG2_DOWNLOAD_URL=$2
WTDBG2_GITHUB_COMMIT_VERSION=$3

source ${LRSDAY_HOME}/soft/common.sh

wtdbg2_dir="${build_dir}/wtdbg2"
if [ -z $(check_installed ${wtdbg2_dir}) ]; then
    cd ${build_dir}
    echo "Download wtdbg2-v${WTDBG2_VERSION}"
    git clone ${WTDBG2_DOWNLOAD_URL}
    cd wtdbg2
    git checkout -f -q ${WTDBG2_GITHUB_COMMIT_VERSION}
    C_INCLUDE_PATH="" 
    make -j $MAKE_JOBS
    note_installed ${wtdbg2_dir}
fi

cd ${LRSDAY_HOME}

echo "export wtdbg2_dir=${wtdbg2_dir}" >> env.sh

echo "wtdbg2 DONE!"
