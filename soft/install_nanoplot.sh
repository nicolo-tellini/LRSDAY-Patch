#!/bin/bash

LRSDAY_HOME=$(pwd)
NANOPLOT_VERSION=$1
NUMPY_VERSION=$2
SCIPY_VERSION=$3

source ${LRSDAY_HOME}/soft/common.sh

nanoplot_dir="${build_dir}/py3_virtualenv_nanoplot/bin"
if [ -z $(check_installed ${nanoplot_dir}) ]; then
    cd ${build_dir}
    virtualenv -p $(which python3) py3_virtualenv_nanoplot
    source py3_virtualenv_nanoplot/bin/activate
    py3_virtualenv_nanoplot/bin/pip install --upgrade pip
    py3_virtualenv_nanoplot/bin/pip install --upgrade setuptools
    py3_virtualenv_nanoplot/bin/pip install numpy==${NUMPY_VERSION}
    py3_virtualenv_nanoplot/bin/pip install scipy==${SCIPY_VERSION}
    py3_virtualenv_nanoplot/bin/pip install NanoPlot==${NANOPLOT_VERSION}
    deactivate
    note_installed ${nanoplot_dir}
fi

cd ${LRSDAY_HOME}

echo "export nanoplot_dir=${nanoplot_dir}" >> env.sh

echo "NANOPLOT DONE!"
