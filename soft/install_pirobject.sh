#!/bin/bash

LRSDAY_HOME=$(pwd)
PIROBJECT_VERSION=$1
PIROBJECT_DOWNLOAD_URL=$2
PIRMODELS_GITHUB_COMMIT_VERSION=$3
PIRMODELS_DOWNLOAD_URL=$4

source ${LRSDAY_HOME}/soft/common.sh

pirobject_dir="${build_dir}/PirObject-${PIROBJECT_VERSION}"
if [ -z $(check_installed ${pirobject_dir}) ]; then
    cd ${build_dir}
    echo "Download PirObject"
    download_and_extract ${PIROBJECT_DOWNLOAD_URL} "pirobject_v${PIROBJECT_VERSION}.tar.gz"
    cd PirObject-${PIROBJECT_VERSION}
    ln -s ./lib/PirObject.pm .
    note_installed ${pirobject_dir}
fi

cd ${LRSDAY_HOME}

echo "export pirobject_dir=${pirobject_dir}" >> env.sh

echo "pirobject DONE!"

pirmodels_dir="${pirobject_dir}/PirModels"
if [ -z $(check_installed ${pirmodels_dir}) ]; then
    cd ${build_dir}
    echo "Download PirModels"
    git clone ${PIRMODELS_DOWNLOAD_URL}
    cd PirModels
    git checkout -f -q ${PIRMODELS_GITHUB_COMMIT_VERSION}
    cd ..
    cp -r PirModels ${pirobject_dir}
    note_installed ${pirmodels_dir}
fi

cd ${LRSDAY_HOME}

echo "export pirmodels_dir=${pirmodels_dir}" >> env.sh

echo "pirmodels DONE!"
