#!/bin/bash

LRSDAY_HOME=$(pwd)
RNAFINDER_DOWNLOAD_URL=$1
RNAFINDER_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

rnafinder_dir="${build_dir}/RNAfinder"
if [ -z $(check_installed ${rnafinder_dir}) ]; then
    cd ${build_dir}
    echo "Download RNAfinder"
    git clone ${RNAFINDER_DOWNLOAD_URL}
    cd RNAfinder
    git checkout -f -q ${RNAFINDER_GITHUB_COMMIT_VERSION}
    cp DOT_RNAfinder.cfg .RNAfinder.cfg
    note_installed ${rnafinder_dir}
fi

cd ${LRSDAY_HOME}

echo "export rnafinder_dir=${rnafinder_dir}" >> env.sh

echo "RNAfinder DONE!"
