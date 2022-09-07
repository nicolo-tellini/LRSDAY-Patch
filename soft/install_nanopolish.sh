#!/bin/bash

LRSDAY_HOME=$(pwd)
NANOPOLISH_VERSION=$1
NANOPOLISH_DOWNLOAD_URL=$2
#NANOPOLISH_GITHUB_COMMIT_VERSION=$3

source ${LRSDAY_HOME}/soft/common.sh

nanopolish_dir="${build_dir}/nanopolish"
#nanopolish_virtualenv_dir="$build_dir/nanopolish/py3_virtualenv_nanopolish/bin"
if [ -z $(check_installed $nanopolish_dir) ]; then
    cd $build_dir
    echo "Download nanopolish-v${NANOPOLISH_VERSION}"
    git clone --recursive $NANOPOLISH_DOWNLOAD_URL
    cd $nanopolish_dir
    pip3 install -r scripts/requirements.txt --user
    #git checkout -f -q $NANOPOLISH_GITHUB_COMMIT_VERSION
    make
    #virtualenv -p python3.8 py3_virtualenv_nanopolish
    #source py3_virtualenv_nanopolish/bin/activate
    #py3_virtualenv_nanopolish/bin/pip install biopython
    #py3_virtualenv_nanopolish/bin/pip install pysam
    #deactivate
    #rm *.tar.gz
    #rm *.tar.bz2
    note_installed $nanopolish_dir
fi

cd ${LRSDAY_HOME}

echo "export nanopolish_dir=${nanopolish_dir}" >> env.sh

echo "NANOPOLISH DONE!"
