#!/bin/bash

LRSDAY_HOME=$(pwd)
REANNOTATE_VERSION=$1
REANNOTATE_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

reannotate_dir="${build_dir}/REannotate_LongQueryName-version_${REANNOTATE_VERSION}"
if [ -z $(check_installed ${reannotate_dir}) ]; then
    cd ${build_dir}
    echo "Download REannotate-v${REANNOTATE_VERSION}"
    download_and_extract ${REANNOTATE_DOWNLOAD_URL} "version_${REANNOTATE_VERSION}.tar.gz"
    cd ${reannotate_dir}
    chmod 755 REannotate_longname
    sed -i 's/my($SEQ,$FASTAentries_, my $MESSAGES)/my($SEQ,$FASTAentries_,$MESSAGES)/g' REannotate_longname
    ln -s REannotate_longname REannotate
    note_installed ${reannotate_dir}
fi

cd ${LRSDAY_HOME}

echo "export reannotate_dir=${reannotate_dir}" >> env.sh

echo "REANNOTATE DONE!"
