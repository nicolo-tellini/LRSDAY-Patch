#!/bin/bash

LRSDAY_HOME=$(pwd)
PORECHOP_VERSION=$1

source ${LRSDAY_HOME}/soft/common.sh

porechop_dir="${build_dir}/conda_porechop_env/bin"
if [ -z $(check_installed ${porechop_dir}) ]; then
    cd ${build_dir}
    echo "Download Porechop-v${PORECHOP_VERSION}"
    ${miniconda3_dir}/conda create -y -p ${build_dir}/conda_porechop_env python=3.7
    source ${miniconda3_dir}/activate ${build_dir}/conda_porechop_env
    ${miniconda3_dir}/conda install -y -c bioconda porechop=${PORECHOP_VERSION} 
    source ${miniconda3_dir}/deactivate
    note_installed ${porechop_dir}
fi


cd ${LRSDAY_HOME}

echo "export porechop_dir=${porechop_dir}" >> env.sh

echo "PORECHOP DONE!"
