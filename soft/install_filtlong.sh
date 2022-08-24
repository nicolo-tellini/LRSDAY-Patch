#!/bin/bash

LRSDAY_HOME=$(pwd)
FILTLONG_VERSION=$1
FILTLONG_DOWNLOAD_URL=$2
FILTLONG_GITHUB_COMMIT_VERSION=$3

source ${LRSDAY_HOME}/soft/common.sh

filtlong_dir="${build_dir}/Filtlong/bin"
if [ -z $(check_installed ${filtlong_dir}) ]; then
    cd ${build_dir}
    echo "Download Filtlong-v${FILTLONG_VERSION}"
    git clone ${FILTLONG_DOWNLOAD_URL}
    cd Filtlong
    git checkout -f -q ${FILTLONG_GITHUB_COMMIT_VERSION}
    make -j $MAKE_JOBS
    note_installed $filtlong_dir
fi

cd ${LRSDAY_HOME}

echo "export filtlong_dir=${filtlong_dir}" >> env.sh

echo "FILTLONG DONE!"
