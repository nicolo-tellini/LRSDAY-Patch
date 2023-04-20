#!/bin/bash

LRSDAY_HOME=$(pwd)
FLYE_VERSION=$1

source ${LRSDAY_HOME}/soft/common.sh

flye_dir="${build_dir}/conda_flye_env/bin"
if [ -z $(check_installed ${flye_dir}) ]; then
    cd ${build_dir}
    ${miniconda3_dir}/conda create -y -p ${build_dir}/conda_flye_env python=3.7
    source ${miniconda3_dir}/activate ${build_dir}/conda_flye_env
    ${miniconda3_dir}/conda install -y -c bioconda flye=${FLYE_VERSION} 
    source ${miniconda3_dir}/deactivate
    note_installed ${flye_dir}
fi

cd ${LRSDAY_HOME}

echo "export flye_dir=${flye_dir}" >> env.sh

echo "FLYE DONE!"
