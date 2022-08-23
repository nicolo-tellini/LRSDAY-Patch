#!/bin/bash

LRSDAY_HOME=$(pwd)
HMMSEARCHWC_DOWNLOAD_URL=$1
HMMSEARCHWC_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

hmmsearchwc_dir="${build_dir}/HMMsearchWC"
if [ -z $(check_installed ${hmmsearchwc_dir}) ]; then
    cd ${build_dir}
    echo "Download HMMsearchWC"
    git clone ${HMMSEARCHWC_DOWNLOAD_URL}
    cd HMMsearchWC
    git checkout -f -q ${HMMSEARCHWC_GITHUB_COMMIT_VERSION}
    note_installed ${hmmsearchwc_dir}
fi

cd ${LRSDAY_HOME}

echo "export hmmsearchwc_dir=${hmmsearchwc_dir}" >> env.sh

echo "hmmsearchwc DONE!"
