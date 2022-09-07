#!/bin/bash

LRSDAY_HOME=$(pwd)
MINICONDA38_VERSION=$1
MINICONDA38_DOWNLOAD_URL=$2
MINICONDA38_VERSION=py38_4.11.0
MINICONDA38_DOWNLOAD_URL=https://repo.anaconda.com/miniconda/Miniconda3-py38_4.11.0-Linux-x86_64.sh
mainland_china_installation="no"

source ${LRSDAY_HOME}/soft/common.sh

if [ -z $(check_installed ${miniconda38_dir}) ]
then
cd ${build_dir}
download ${MINICONDA38_DOWNLOAD_URL} "Miniconda3-${MINICONDA38_VERSION}-Linux-x86_64.sh"
bash Miniconda3-${MINICONDA38_VERSION}-Linux-x86_64.sh -b -p ${build_dir}/miniconda38

if [ ${mainland_china_installation} == "yes" ]
then
${miniconda38_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
${miniconda38_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
${miniconda38_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
${miniconda38_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
${miniconda38_dir}/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
${miniconda38_dir}/conda config --set show_channel_urls yes
rm ${build_dir}/Miniconda3-${MINICONDA38_VERSION}-Linux-x86_64.sh 
note_installed ${miniconda38_dir}
else 
${miniconda38_dir}/conda config --add channels defaults
${miniconda38_dir}/conda config --add channels bioconda
${miniconda38_dir}/conda config --add channels conda-forge
${miniconda38_dir}/conda config --set show_channel_urls yes
rm ${build_dir}/Miniconda3-${MINICONDA38_VERSION}-Linux-x86_64.sh 
note_installed ${miniconda38_dir}
fi
fi

cd ${miniconda38_dir}

./pip3 install circlator
./pip3 install medaka
./pip3 install nanoplot

export PATH="${miniconda38_dir}:$PATH"

cd ${LRSDAY_HOME}

echo "export circlator_dir=${miniconda38_dir}" >> env.sh
echo "export nanoplot_dir=${miniconda38_dir}">> env.sh
echo "export medaka_dir=${miniconda38_dir}">> env.sh

echo "CIRCLATOR DONE"
echo "NANOPLOT DONE"
echo "MEDAKA DONE"
