#!/bin/bash

LRSDAY_HOME=$(pwd)
MINICONDA3_VERSION=$1
MINICONDA3_DOWNLOAD_URL=$2
mainland_china_installation="no"

source ${LRSDAY_HOME}/soft/common.sh

if [ -z $(check_installed ${miniconda3_dir}) ]; then
    cd ${build_dir}
    download ${MINICONDA3_DOWNLOAD_URL} "Miniconda3-${MINICONDA3_VERSION}-Linux-x86_64.sh"
    bash Miniconda3-${MINICONDA3_VERSION}-Linux-x86_64.sh -b -p ${build_dir}/miniconda3
    if [ ${mainland_china_installation} == "yes" ]
    then
	${miniconda3_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
	${miniconda3_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
	${miniconda3_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
	${miniconda3_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
	${miniconda3_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
        ${miniconda3_dir}/conda config --set show_channel_urls yes
        rm ${build_dir}/Miniconda3-${MINICONDA3_VERSION}-Linux-x86_64.sh 
        note_installed ${miniconda3_dir}
    else 
	${miniconda3_dir}/conda config --add channels defaults
	${miniconda3_dir}/conda config --add channels bioconda
	${miniconda3_dir}/conda config --add channels conda-forge
        ${miniconda3_dir}/conda config --set show_channel_urls yes
        rm ${build_dir}/Miniconda3-${MINICONDA3_VERSION}-Linux-x86_64.sh 
        note_installed ${miniconda3_dir}
    fi
fi

cd ${LRSDAY_HOME}

echo "export miniconda3_dir=${miniconda3_dir}" >> env.sh

echo "MINICONDA DONE!"
