#!/bin/bash

LRSDAY_HOME=$(pwd)
GATK_DOWNLOAD_URL=$1

source ${LRSDAY_HOME}/soft/common.sh

gatk3_dir="${build_dir}/GATK3"
if [ -z $(check_installed ${gatk3_dir}) ]; then
    cd ${build_dir}
    echo "Create the GATK3 folder for installation"
    mkdir GATK3
    cd GATK3
    wget -nv --no-check-certificate $GATK_DOWNLOAD_URL
    tar -xf GenomeAnalysisTK-3.2-2-gec30cee.tar.bz2
    chmod 755 GenomeAnalysisTK.jar
    rm GenomeAnalysisTK-3.2-2-gec30cee.tar.bz2
    note_installed ${gatk3_dir}
fi

cd ${LRSDAY_HOME}

echo "export gatk3_dir=${gatk3_dir}" >> env.sh

echo "GATK3 DONE!"

