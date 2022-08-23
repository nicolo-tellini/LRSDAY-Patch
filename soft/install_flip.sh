#!/bin/bash

LRSDAY_HOME=$(pwd)
FLIP_DOWNLOAD_URL=$1
FLIP_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

flip_dir="${build_dir}/Flip"
if [ -z $(check_installed ${flip_dir}) ]; then
    cd ${build_dir}
    echo "Download Flip"
    git clone ${FLIP_DOWNLOAD_URL}
    cd Flip
    git checkout -f -q ${FLIP_GITHUB_COMMIT_VERSION}
    cd src
    make -j ${MAKE_JOBS}
    cp flip ./../
    note_installed ${flip_dir}
fi

cd ${LRSDAY_HOME}

echo "export flip_dir=${flip_dir}" >> env.sh

echo "FLIP DONE!"
