#!/bin/bash

LRSDAY_HOME=$(pwd)
RAGOUT_VERSION=$1
RAGOUT_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

ragout_dir="${build_dir}/conda_ragout_env/bin"
if [ -z $(check_installed ${ragout_dir}) ]; then
    cd ${build_dir}
    ${miniconda3_dir}/conda create -y -p ${build_dir}/conda_ragout_env python=3.7
    source ${miniconda3_dir}/activate ${build_dir}/conda_ragout_env
    ${miniconda3_dir}/conda install -y -c bioconda ragout=${RAGOUT_VERSION} 
    source ${miniconda3_dir}/deactivate
    note_installed ${ragout_dir}
fi

cd ${LRSDAY_HOME}

echo "export ragout_dir=${ragout_dir}" >> env.sh

echo "RAGOUT DONE!"
