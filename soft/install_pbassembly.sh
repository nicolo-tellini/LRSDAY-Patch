#!/bin/bash

LRSDAY_HOME=$(pwd)
PB_ASSEMBLY_VERSION1=$1
PB_ASSEMBLY_VERSION2=$2
BAX2BAM_VERSION=$3
pbbam_VERSION=$4
HDF_VERSION=$5

source ${LRSDAY_HOME}/soft/common.sh

pacbio_dir=${build_dir}/conda_pacbio_env/bin
if [ -z $(check_installed ${pacbio_dir}) ]; then
    
    cd ${build_dir}
    
    ${miniconda3_dir}/conda create -y -p ${build_dir}/conda_pacbio_env python=3.7
    source ${miniconda3_dir}/activate ${build_dir}/conda_pacbio_env
    
    ${miniconda3_dir}/conda install -y hdf5=${HDF_VERSION}
    ${miniconda3_dir}/conda install -y -c bioconda pb-assembly=${PB_ASSEMBLY_VERSION1}

    source ${miniconda3_dir}/deactivate
fi

note_installed ${pacbio_dir}

cd ${LRSDAY_HOME}

echo "export conda_pacbio_env=${pacbio_dir}" >> env.sh

echo "PB v0.0.8 DONE!"

pacbio_dir2=${build_dir}/conda_pacbio_env2/bin
if [ -z $(check_installed ${pacbio_dir}2) ]; then
    
    cd ${build_dir}

    ${miniconda3_dir}/conda create -y -p ${build_dir}/conda_pacbio_env2 python=2.7
    source ${miniconda3_dir}/activate ${build_dir}/conda_pacbio_env2

    ${miniconda3_dir}/conda install -y -c bioconda pb-assembly=${PB_ASSEMBLY_VERSION2}
    ${miniconda3_dir}/conda install -y -c bioconda pbbam=${pbbam_VERSION}
    ${miniconda3_dir}/conda install -y -c bioconda bax2bam=${BAX2BAM_VERSION}

    source ${miniconda3_dir}/deactivate
fi
note_installed ${pacbio_dir2}

cd ${LRSDAY_HOME}

echo "export conda_pacbio_env2=${pacbio_dir2}" >> env.sh

echo "PB v0.0.3 DONE!"
