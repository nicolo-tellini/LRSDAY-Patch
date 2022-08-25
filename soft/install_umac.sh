#!/bin/bash

LRSDAY_HOME=$(pwd)
UMAC_DOWNLOAD_URL=$1
UMAC_GITHUB_COMMIT_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

umac_dir="${build_dir}/Umac"
if [ -z $(check_installed ${umac_dir}) ]; then
    cd ${build_dir}
    echo "Download Umac"
    git clone ${UMAC_DOWNLOAD_URL}
    cd Umac
    git checkout -f -q ${UMAC_GITHUB_COMMIT_VERSION}
    note_installed ${umac_dir}
fi

cd ${LRSDAY_HOME}

echo "export umac_dir=${umac_dir}" >> env.sh

echo "UMAC DONE!"
