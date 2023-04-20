#!/bin/bash

LRSDAY_HOME=$(pwd)
PROTEINORTHO_VERSION=$1
DIAMOND_VERSION=$2

source ${LRSDAY_HOME}/soft/common.sh

proteinortho_dir="${build_dir}/proteinortho_v${PROTEINORTHO_VERSION}"
if [ -z $(check_installed ${proteinortho_dir}) ]; then
    cd ${build_dir}
    echo "Download Porteinortho-v${PROTEINORTHO_VERSION}"
    ${miniconda3_dir}/conda create -y -p ${build_dir}/proteinortho_conda_env
    source ${miniconda3_dir}/activate ${build_dir}/proteinortho_conda_env
    ${miniconda3_dir}/conda install -y proteinortho=${PROTEINORTHO_VERSION}
    ${miniconda3_dir}/conda install -y -c bioconda diamond=${DIAMOND_VERSION}
    ${miniconda3_dir}/conda install -y -c bioconda blast=2.10.1
    ${miniconda3_dir}/conda install -y -c bioconda last
    source ${miniconda3_dir}/deactivate
    proteinortho_dir="${build_dir}/proteinortho_conda_env/bin"
    diamond_dir="${build_dir}/proteinortho_conda_env/bin"
    note_installed ${proteinortho_dir}
fi

cd ${LRSDAY_HOME}

echo "export proteinortho_dir=${proteinortho_dir}" >> env.sh
echo "export diamond_dir=${diamond_dir}" >> env.sh

echo "PROTEINORTHO DONE!"
