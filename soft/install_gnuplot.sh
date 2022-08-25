#!/bin/bash

LRSDAY_HOME=$(pwd)
GNUPLOT_VERSION=$1
GNUPLOT_DOWNLOAD_URL=$2

source ${LRSDAY_HOME}/soft/common.sh

gnuplot_dir="$build_dir/gnuplot-${GNUPLOT_VERSION}/bin"
if [ -z $(check_installed ${gnuplot_dir}) ]; then
    cd $build_dir
    echo "Download gnuplot-v${GNUPLOT_VERSION}"
    download_and_extract $GNUPLOT_DOWNLOAD_URL "gnuplot-${GNUPLOT_VERSION}.tar.gz"
    cd "$build_dir/gnuplot-${GNUPLOT_VERSION}"
    ./configure --prefix="$build_dir/gnuplot-${GNUPLOT_VERSION}" --disable-wxwidgets --with-texdir
    make -j $MAKE_JOBS 
    make install 
    note_installed ${gnuplot_dir}
fi
PATH="${gnuplot_dir}:${PATH}"

cd ${LRSDAY_HOME}

echo "export gnuplot_dir=${gnuplot_dir}" >> env.sh

echo "GNUPLOT DONE!"
