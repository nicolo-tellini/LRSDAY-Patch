#!/bin/bash

LRSDAY_HOME=$(pwd)
SNAP_DOWNLOAD_URL=$1
SNAP_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

snap_dir="${build_dir}/SNAP"
if [ -z $(check_installed ${snap_dir}) ]; then
    cd ${build_dir}
    git clone ${SNAP_DOWNLOAD_URL}
    cd ${snap_dir}
    git checkout -f -q ${SNAP_GITHUB_COMMIT_VERSION}
    ZOE="${snap_dir}/Zoe"
    cp ${LRSDAY_HOME}/misc/snap.c .
    make -j ${MAKE_JOBS}
    note_installed ${snap_dir}
fi

cd ${LRSDAY_HOME}

echo "export snap_dir=${snap_dir}" >> env.sh

echo "SNAP DONE!"
