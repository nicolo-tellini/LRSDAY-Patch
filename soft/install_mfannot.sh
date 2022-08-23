#!/bin/bash

LRSDAY_HOME=$(pwd)
MFANNOT_VERSION=$1
MFANNOT_DOWNLOAD_URL=$2
MFANNOT_GITHUB_COMMIT_VERSION=$3
MFANNOT_DATA_DOWNLOAD_URL=$4
MFANNOT_DATA_GITHUB_COMMIT_VERSION=$5

source ${LRSDAY_HOME}/soft/common.sh

mfannot_data_dir="${build_dir}/MFannot_data"
if [ -z $(check_installed ${mfannot_data_dir}) ]; then
    cd ${build_dir}
    echo "Download MFannot_data"
    git clone ${MFANNOT_DATA_DOWNLOAD_URL}
    cd MFannot_data
    git checkout -f -q ${MFANNOT_DATA_GITHUB_COMMIT_VERSION}
    note_installed ${mfannot_data_dir}
fi

cd ${LRSDAY_HOME}

echo "export miniconda3_dir=${miniconda3_dir}" >> env.sh

echo "MFANNOT_DATA DONE!"

mfannot_dir="${build_dir}/MFannot"
if [ -z $(check_installed ${mfannot_dir}) ]; then
    cd ${build_dir}
    echo "Download MFannot"
    git clone ${MFANNOT_DOWNLOAD_URL}
    cd MFannot
    git checkout -f -q ${MFANNOT_GITHUB_COMMIT_VERSION}
    note_installed ${mfannot_dir}
fi

cd ${LRSDAY_HOME}

echo "export mfannot_dir=${mfannot_dir}" >> env.sh

echo "MFANNOT DONE!"
