#!/bin/bash

LRSDAY_HOME=$(pwd)
BLAT_DOWNLOAD_URL=$1
FASPLIT_DOWNLOAD_URL=$2
PSLSORT_DOWNLOAD_URL=$3
PSLSCORE_DOWNLOAD_URL=$4
PSLCDNAFILTER_DOWNLOAD_URL=$5

source ${LRSDAY_HOME}/soft/common.sh

ucsc_dir="${build_dir}/UCSC_Utilities"
if [ -z $(check_installed ${ucsc_dir}) ]; then
    cd ${build_dir}
    mkdir UCSC_Utilities
    cd ${ucsc_dir}
    download ${BLAT_DOWNLOAD_URL} "blat"
    download ${FASPLIT_DOWNLOAD_URL} "faSplit"
    download ${PSLSORT_DOWNLOAD_URL} "pslSort"
    download ${PSLSCORE_DOWNLOAD_URL} "pslScore"
    download ${PSLCDNAFILTER_DOWNLOAD_URL} "pslCDnaFilter"
    chmod 755 ${ucsc_dir}/*
    note_installed ${ucsc_dir}
fi

cd ${LRSDAY_HOME}

echo "export ucsc_dir=${ucsc_dir}" >> env.sh

echo "UCSC DONE!"
