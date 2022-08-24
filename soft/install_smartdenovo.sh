#!/bin/bash

LRSDAY_HOME=$(pwd)
SMARTDENOVO_DOWNLOAD_URL=$1
SMARTDENOVO_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

smartdenovo_dir="${build_dir}/smartdenovo"
if [ -z $(check_installed $smartdenovo_dir) ]; then
    cd ${build_dir}
    git clone ${SMARTDENOVO_DOWNLOAD_URL}
    cd smartdenovo
    git checkout -f -q ${SMARTDENOVO_GITHUB_COMMIT_VERSION}
    cp wtlay.h wtlay.h.bk
    cat wtlay.h.bk |sed s/inline//g > wtlay.h
    C_INCLUDE_PATH="" 
    make -j ${MAKE_JOBS}
    cp ${LRSDAY_HOME}/misc/smartdenovo_customized.pl .
    note_installed ${smartdenovo_dir}
fi

cd ${LRSDAY_HOME}

echo "export smartdenovo_dir=${smartdenovo_dir}" >> env.sh

echo "SMARTDENOVO DONE!"
