#!/bin/bash

# ---- LRSDAY_HOME and build_dir var ---- #

LRSDAY_HOME=$(pwd)
build_dir=${LRSDAY_HOME}/build

# ---- miniconda3_dir var ---- #

miniconda3_dir="$build_dir/miniconda3/bin"

# ---- Perl & Python environment variables ---- #

PYTHONPATH="${build_dir}"
PERL5LIB="${build_dir}:$PERL5LIB"
PERL5LIB="${build_dir}/cpanm/perlmods/lib/perl5:$PERL5LIB"
cpanm_dir=${build_dir}/cpanm

# ---- MAKE_JOBS var ---- #

if [ -z "$MAKE_JOBS" ]
then
    MAKE_JOBS=2
fi

# ---- Download function ---- #

download () {

  url=$1
  download_location=$2
  echo "Downloading $url to $download_location"
  wget --no-check-certificate $url -O $download_location

}

# ---- Download and Extract function ---- #

download_and_extract() {

    url=$1
    download_location=$2
    echo "Downloading $url to $download_location"
    wget --no-check-certificate $url -O $download_location

    if [[ $download_location =~ \.bz2$ ]]; then
        extract_command="tar -xjf"
    elif [[ $download_location =~ \.xz$ || $download_location =~ \.tar$ ]]; then
        extract_command="tar -xf"
    else
        extract_command="tar -zxf"
    fi
    $($extract_command $download_location)
    rm $download_location

}

# ---- Check installed function ---- #

check_installed() {

    if [ -e "$1/installed" ]; then
        echo "installed"
    else
        echo ""
    fi

}

# ---- Note function ---- #

note_installed() {
    touch "$1/installed"
}
