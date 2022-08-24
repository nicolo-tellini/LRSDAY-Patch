#!/bin/bash

LRSDAY_HOME=$(pwd)

source ${LRSDAY_HOME}/soft/common.sh

# ---- SOFTWARE LIST ---- #

# yes: install
# no: do not install

SETpERLaNDpYTHON="yes"
MINICONDA3="yes"
SRA="yes"
GUPPY="yes"
PORECHOP="yes"
FILTLONG="yes"
NANOPLOT="yes"
MINIMAP2="yes"
CANU="yes"
FLYE="yes"
WTDBG2="yes"
SMARTDENOVO="yes"
SHASTA="yes"
PB_ASSEMBLY="yes"
PARALLEL="yes"
RACON="yes"
MARGINPOLISH="yes"
RAGOO="yes"
MUMMER4="yes"
BEDTOOLS="yes"
SPADES="yes"
PRODIGAL="yes"
BWA="yes"
SAMTOOLS="yes"
CIRCLATOR="yes"
TRIMMOMATIC="yes"
PICARD="yes"
PILON="yes"
EXONERATE="yes"
BLAST="yes"
SNAP="yes"
UCSC="yes"
MFANNOT="yes"
RAPSEARCH="yes"
TRNASCAN="yes"
SNOSCAN="yes"
REPEATMASKER="yes"
TRF="yes"
REANNOTATE="yes"
CLUSTALW="yes"
MUSCLE="yes"
HMMER="yes"
BAMTOOLS="yes"
AUGUSTUS="yes"
EVM="yes"
PROTEINORTHO="yes"
EMBOSS="yes"
ERPIN="yes"
TBL2ASN="yes"
PIROBJECT="yes"
FLIP="yes"
UMAC="yes"
HMMSEARCHWC="yes"
RNAFINDER="yes"
MF2SQN="yes"
GRABFASTA="yes"
RAGOUT="yes"
GATK="yes"
CAP3="yes"
MEDAKA="yes"
GNUPLOT="yes"
MAKER="yes"
RA="yes"

# NANOPOLISH compilation fails.
# I am taking contact with the developer.
# If you really need it you can:
# 1) install it from Ubuntu repos: "sudo apt-get install nanopolish" ;
# 2) manually add "export nanopolish_dir=/path/to/nanonopolish/bin" to env.sh files in LRSDAY home;
# 3) to find out where NANOPOLISH binaries are run: "whereis nanopolish" (most of the times it is in /usr/bin);
# 4) IMPORTANT: NANOPOLISH from Ubuntu repos is the v0.9.0-1 and not v0.14.0.
#    You have to check if the options used in the script 02.Long-read-based_Assembly_Polishing/LRSDAY.02.Long-read-based_Assembly_Polishing.sh are compatible with v0.9.0-1.
#    Nanopolish runs at lines 75-96.
# 5) NOTE: line 78 needs to be commented and at line 87 you have to replace "$nanopolish_dir/scripts" with "/usr/lib/nanopolish".

NANOPOLISH="no"

# ---- INSTALLER BODY ---- #

# Create Build, Log and Err dirs
mkdir -p ${build_dir}
mkdir -p ${LRSDAY_HOME}/soft/Log
mkdir -p ${LRSDAY_HOME}/soft/Err

# ---- INITIALIZE env.sh ---- #

FILE=$LRSDAY_HOME/env.sh

if test -f "$FILE"; then
 printf '█ (0%%)\r'
else

echo "export LRSDAY_HOME=${LRSDAY_HOME}" > env.sh
echo "export build_dir=${build_dir}" >> env.sh
echo "export PYTHONPATH=${PYTHONPATH}" >> env.sh
echo "export PERL5LIB=${PERL5LIB}" >> env.sh 
echo "export cpanm_dir=${cpanm_dir}" >> env.sh
fi

printf '█ (1%%)\r'

# ---- SETpERLaNDpYTHON ---- # OK
if [ $SETpERLaNDpYTHON == "yes" ]
then

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/set_perlandpython.sh > ${LRSDAY_HOME}/soft/Log/set_perlandpython.log 2> ${LRSDAY_HOME}/soft/Err/set_perlandpython.err

fi

printf '█ (2%%)\r'

# ---- MINICONDA ---- # OK
if [ $MINICONDA3 == "yes" ]
then

MINICONDA3_VERSION="py37_4.8.2" 
MINICONDA3_DOWNLOAD_URL="https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA3_VERSION}-Linux-x86_64.sh"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_miniconda.sh $MINICONDA3_VERSION $MINICONDA3_DOWNLOAD_URL > ${LRSDAY_HOME}/soft/Log/install_miniconda.log 2> ${LRSDAY_HOME}/soft/Err/install_miniconda.err

fi

printf '██ (4%%)\r'

# ----- SRA ---- # OK
if [ $SRA == "yes" ]
then

SRA_VERSION="2.9.6" 
SRA_DOWNLOAD_URL="https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${SRA_VERSION}/sratoolkit.${SRA_VERSION}-centos_linux64.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_sra.sh ${SRA_VERSION} ${SRA_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_sra.log 2> ${LRSDAY_HOME}/soft/Err/install_sra.err


fi

printf '███ (6%%)\r'

# ---- GUPPY ---- # OK
if [ $GUPPY == "yes" ]
then

GUPPY_VERSION="4.0.15" 
GUPPY_DOWNLOAD_URL="https://mirror.oxfordnanoportal.com/software/analysis/ont-guppy-cpu_${GUPPY_VERSION}_linux64.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_guppy.sh ${GUPPY_VERSION} ${GUPPY_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_guppy.log 2> ${LRSDAY_HOME}/soft/Err/install_guppy.err


fi

# ---- RAGOUT ---- # OK

if [ $RAGOUT == "yes" ]
then

RAGOUT_VERSION="2.3"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_ragout.sh ${RAGOUT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_ragout.log 2> ${LRSDAY_HOME}/soft/Err/install_ragout.err

fi


printf '████ (8%%)\r'

# ---- PORECHOP ---- # OK
if [ $PORECHOP == "yes" ]
then

PORECHOP_VERSION="0.2.4"  

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_porechop.sh ${PORECHOP_VERSION} > ${LRSDAY_HOME}/soft/Log/install_porechop.log 2> ${LRSDAY_HOME}/soft/Err/install_porechop.err

fi

printf '█████ (10%%)\r'

# ---- FILTLONG ---- # OK
if [ $FILTLONG == "yes" ]
then

FILTLONG_VERSION="0.2.0" 
FILTLONG_DOWNLOAD_URL="https://github.com/rrwick/Filtlong.git"
FILTLONG_GITHUB_COMMIT_VERSION="13504b7" 

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_filtlong.sh ${FILTLONG_VERSION} ${FILTLONG_DOWNLOAD_URL} ${FILTLONG_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_filtlong.log 2> ${LRSDAY_HOME}/soft/Err/install_filtlong.err


fi

printf '██████ (12%%)\r'

# ---- NANOPLOT ---- # OK
if [ $NANOPLOT == "yes" ]
then

NANOPLOT_VERSION="1.29.1"
NUMPY_VERSION="1.16.3"
SCIPY_VERSION="1.2.1"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_nanoplot.sh ${NANOPLOT_VERSION} ${NUMPY_VERSION} ${SCIPY_VERSION} > ${LRSDAY_HOME}/soft/Log/install_nanoplot.log 2> ${LRSDAY_HOME}/soft/Err/install_nanoplot.err


fi

printf '███████ (14%%)\r'

# ---- MINIMAP2 ---- # OK

if [ $MINIMAP2 == "yes" ]
then

MINIMAP2_VERSION="2.17" 
MINIMAP2_DOWNLOAD_URL="https://github.com/lh3/minimap2/releases/download/v${MINIMAP2_VERSION}/minimap2-${MINIMAP2_VERSION}_x64-linux.tar.bz2"


/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_minimap2.sh ${MINIMAP2_VERSION} ${MINIMAP2_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_minimap2.log 2> ${LRSDAY_HOME}/soft/Err/install_minimap2.err


fi

printf '████████ (16%%)\r'

# ---- CANU ---- # OK

if [ $CANU == "yes" ]
then

CANU_VERSION="2.1.1"
CANU_DOWNLOAD_URL="https://github.com/marbl/canu/releases/download/v${CANU_VERSION}/canu-${CANU_VERSION}.Linux-amd64.tar.xz"


/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_canu.sh ${CANU_VERSION} ${CANU_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_canu.log 2> ${LRSDAY_HOME}/soft/Err/install_canu.err


fi

printf '█████████ (18%%)\r'

# ---- FLYE ---- # OK

if [ $FLYE == "yes" ]
then

FLYE_VERSION="2.8.2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_flye.sh ${FLYE_VERSION} ${FLYE_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_flye.log 2> ${LRSDAY_HOME}/soft/Err/install_flye.err


fi

printf '██████████ (20%%)\r'

# ---- WTDBG2 ---- # OK

if [ $WTDBG2 == "yes" ]
then

WTDBG2_VERSION="2.5"  
WTDBG2_DOWNLOAD_URL="https://github.com/ruanjue/wtdbg2.git"
WTDBG2_GITHUB_COMMIT_VERSION="b77c565"


/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_wtdbg2.sh ${WTDBG2_VERSION} ${WTDBG2_DOWNLOAD_URL} ${WTDBG2_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_wtdbg2.log 2> ${LRSDAY_HOME}/soft/Err/install_wtdbg2.err


fi

printf '███████████ (22%%)\r'

# ---- SMARTDENOVO ---- # OK

if [ $SMARTDENOVO == "yes" ]
then

SMARTDENOVO_GITHUB_COMMIT_VERSION="5cc1356" 
SMARTDENOVO_DOWNLOAD_URL="https://github.com/ruanjue/smartdenovo"


/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_smartdenovo.sh ${SMARTDENOVO_DOWNLOAD_URL} ${SMARTDENOVO_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_smartdenovo.log 2> ${LRSDAY_HOME}/soft/Err/install_smartdenovo.err


fi

printf '████████████ (24%%)\r'




# ---- SHASTA ---- # OK

if [ $SHASTA == "yes" ]
then

SHASTA_VERSION="0.7.0"
SHASTA_DOWNLOAD_URL="https://github.com/chanzuckerberg/shasta/releases/download/${SHASTA_VERSION}/shasta-Linux-${SHASTA_VERSION}"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_shasta.sh ${SHASTA_VERSION} ${SHASTA_DOWNLOAD_URL} ${SHASTA_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_shasta.log 2> ${LRSDAY_HOME}/soft/Err/install_shasta.err


fi

printf '█████████████ (26%%)\r'



# ---- PB_ASSEMBLY ---- # OK

if [ $PB_ASSEMBLY == "yes" ]
then

PB_ASSEMBLY_VERSION1="0.0.8"
PB_ASSEMBLY_VERSION2="0.0.3"
BAX2BAM_VERSION="0.0.9"
pbbam_VERSION="0.18.0"
HDF_VERSION="1.10.6" 

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_pbassembly.sh ${PB_ASSEMBLY_VERSION1} ${PB_ASSEMBLY_VERSION2} ${BAX2BAM_VERSION} ${pbbam_VERSION} ${HDF_VERSION} > ${LRSDAY_HOME}/soft/Log/install_pbassembly.log 2> ${LRSDAY_HOME}/soft/Err/install_pbassembly.err


fi

printf '██████████████ (28%%)\r'



# ---- PARALLEL ---- # OK

if [ $PARALLEL == "yes" ]
then

PARALLEL_VERSION="20180722"
PARALLEL_DOWNLOAD_URL="http://ftp.gnu.org/gnu/parallel/parallel-${PARALLEL_VERSION}.tar.bz2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_parallel.sh ${PARALLEL_VERSION} ${PARALLEL_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_parallel.log 2> ${LRSDAY_HOME}/soft/Err/install_parallel.err


fi

printf '███████████████ (30%%)\r'


# ---- RACON ---- # OK

if [ $RACON == "yes" ]
then

RACON_VERSION="1.4.13"
RACON_DOWNLOAD_URL="https://github.com/lbcb-sci/racon/releases/download/${RACON_VERSION}/racon-v${RACON_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_racon.sh ${RACON_VERSION} ${RACON_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_racon.log 2> ${LRSDAY_HOME}/soft/Err/install_racon.err


fi

printf '████████████████ (32%%)\r'



# ---- MARGINPOLISH ---- # OK

if [ $MARGINPOLISH == "yes" ]
then

MARGINPOLISH_VERSION="1.3.0"
MARGINPOLISH_DOWNLOAD_URL="https://github.com/UCSC-nanopore-cgl/marginPolish.git"
MARGINPOLISH_GITHUB_COMMIT_VERSION="5492204"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_marginpolish.sh ${MARGINPOLISH_VERSION} ${MARGINPOLISH_DOWNLOAD_URL} ${MARGINPOLISH_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_marginpolish.log 2> ${LRSDAY_HOME}/soft/Err/install_marginpolish.err


fi

printf '█████████████████ (34%%)\r'



# ---- RAGOO ---- # OK

if [ $RAGOO == "yes" ]
then

RAGOO_VERSION="1.11"
RAGOO_DOWNLOAD_URL="https://github.com/malonge/RaGOO/archive/v${RAGOO_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_ragoo.sh ${RAGOO_VERSION} ${RAGOO_DOWNLOAD_URL} ${NUMPY_VERSION} > ${LRSDAY_HOME}/soft/Log/install_ragoo.log 2> ${LRSDAY_HOME}/soft/Err/install_ragoo.err


fi

printf '██████████████████ (36%%)\r'



# ---- MUMMER4 ---- # OK

if [ $MUMMER4 == "yes" ]
then

MUMMER4_VERSION="4.0.0beta5"
MUMMER4_VERSION1="4.0.0.beta5"
MUMMER4_DOWNLOAD_URL="https://github.com/gmarcais/mummer/releases/download/v${MUMMER4_VERSION1}/mummer-${MUMMER4_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_mummer4.sh ${MUMMER4_VERSION} ${MUMMER4_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_mummer4.log 2> ${LRSDAY_HOME}/soft/Err/install_mummer4.err


fi
printf '███████████████████ (38%%)\r'


# ---- BEDTOOLS ---- # OK

if [ $BEDTOOLS == "yes" ]
then

BEDTOOLS_VERSION="2.29.2"
BEDTOOLS_DOWNLOAD_URL="https://github.com/arq5x/bedtools2/releases/download/v${BEDTOOLS_VERSION}/bedtools-${BEDTOOLS_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_bedtools.sh ${BEDTOOLS_VERSION} ${BEDTOOLS_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_bedtools.log 2> ${LRSDAY_HOME}/soft/Err/install_bedtools.err


fi

printf '████████████████████ (40%%)\r'



# ---- SPADES ---- # OK

if [ $SPADES == "yes" ]
then

SPADES_VERSION="3.14.1"
SPADES_DOWNLOAD_URL="http://cab.spbu.ru/files/release${SPADES_VERSION}/SPAdes-${SPADES_VERSION}-Linux.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_spades.sh ${SPADES_VERSION} ${SPADES_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_spades.log 2> ${LRSDAY_HOME}/soft/Err/install_spades.err


fi

printf '█████████████████████ (42%%)\r'



# ---- PRODIGAL ---- # OK

if [ $PRODIGAL == "yes" ]
then

PRODIGAL_VERSION="2.6.3"
PRODIGAL_DOWNLOAD_URL="https://github.com/hyattpd/Prodigal/archive/v${PRODIGAL_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_prodigal.sh ${PRODIGAL_VERSION} ${PRODIGAL_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_prodigal.log 2> ${LRSDAY_HOME}/soft/Err/install_prodigal.err


fi

printf '██████████████████████ (44%%)\r'


# ---- BWA ---- # OK

if [ $BWA == "yes" ]
then

BWA_VERSION="0.7.17"
BWA_DOWNLOAD_URL="http://downloads.sourceforge.net/project/bio-bwa/bwa-${BWA_VERSION}.tar.bz2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_bwa.sh ${BWA_VERSION} ${BWA_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_bwa.log 2> ${LRSDAY_HOME}/soft/Err/install_bwa.err


fi

printf '███████████████████████ (46%%)\r'


# ---- SAMTOOLS ---- # OK

if [ $SAMTOOLS == "yes" ]
then

SAMTOOLS_VERSION="1.11"
SAMTOOLS_DOWNLOAD_URL="https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_samtools.sh ${SAMTOOLS_VERSION} ${SAMTOOLS_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_samtools.log 2> ${LRSDAY_HOME}/soft/Err/install_samtools.err


fi

printf '████████████████████████ (48%%)\r'


# ---- CIRCLATOR ---- # OK

if [ $CIRCLATOR == "yes" ]
then

CIRCLATOR_VERSION="1.5.5"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_circlator.sh ${CIRCLATOR_VERSION} ${CIRCLATOR_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_circlator.log 2> ${LRSDAY_HOME}/soft/Err/install_circlator.err


fi

printf '█████████████████████████ (50%%)\r'


# ---- TRIMMOMATIC ---- # OK

if [ $TRIMMOMATIC == "yes" ]
then

TRIMMOMATIC_VERSION="0.38"
TRIMMOMATIC_DOWNLOAD_URL="http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-${TRIMMOMATIC_VERSION}.zip"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_trimmomatic.sh ${TRIMMOMATIC_VERSION} ${TRIMMOMATIC_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_trimmomatic.log 2> ${LRSDAY_HOME}/soft/Err/install_trimmomatic.err


fi

printf '██████████████████████████ (52%%)\r'


# ---- PICARD ---- # OK

if [ $PICARD == "yes" ]
then

PICARD_VERSION="2.23.4"
PICARD_DOWNLOAD_URL="https://github.com/broadinstitute/picard/releases/download/${PICARD_VERSION}/picard.jar"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_picard.sh ${PICARD_VERSION} ${PICARD_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_picard.log 2> ${LRSDAY_HOME}/soft/Err/install_picard.err


fi

printf '███████████████████████████ (54%%)\r'

# ---- PILON ---- # OK

if [ $PILON == "yes" ]
then

PILON_VERSION="1.23"
PILON_DOWNLOAD_URL="https://github.com/broadinstitute/pilon/releases/download/v${PILON_VERSION}/pilon-${PILON_VERSION}.jar"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_pilon.sh ${PILON_VERSION} ${PILON_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_pilon.log 2> ${LRSDAY_HOME}/soft/Err/install_pilon.err


fi

printf '████████████████████████████ (56%%)\r'

# ---- EXONERATE ---- # OK

if [ $EXONERATE == "yes" ]
then

EXONERATE_VERSION="2.2.0"  
EXONERATE_DOWNLOAD_URL="http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-${EXONERATE_VERSION}-x86_64.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_exonerate.sh ${EXONERATE_VERSION} ${EXONERATE_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_exonerate.log 2> ${LRSDAY_HOME}/soft/Err/install_exonerate.err


fi

printf '█████████████████████████████ (58%%)\r'


# ---- BLAST FAMILY ---- # OK

if [ $BLAST == "yes" ]
then

BLAST_VERSION="2.2.31"
BLAST_DOWNLOAD_URL="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/${BLAST_VERSION}/ncbi-blast-${BLAST_VERSION}+-x64-linux.tar.gz"
RMBLAST_VERSION="2.2.28"
RMBLAST_DOWNLOAD_URL="ftp://ftp.ncbi.nlm.nih.gov/blast/executables/rmblast/${RMBLAST_VERSION}/ncbi-rmblastn-${RMBLAST_VERSION}-x64-linux.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_blast.sh ${BLAST_VERSION} ${BLAST_DOWNLOAD_URL} ${RMBLAST_VERSION} ${RMBLAST_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_blast.log 2> ${LRSDAY_HOME}/soft/Err/install_blast.err

fi

printf '██████████████████████████████ (60%%)\r'


# ---- SNAP ---- # OK

if [ $SNAP == "yes" ]
then

SNAP_DOWNLOAD_URL="https://github.com/KorfLab/SNAP.git"
SNAP_GITHUB_COMMIT_VERSION="a89d68e"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_snap.sh ${SNAP_DOWNLOAD_URL} ${SNAP_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_snap.log 2> ${LRSDAY_HOME}/soft/Err/install_snap.err

fi

printf '███████████████████████████████ (62%%)\r'

# ---- UCSC Utilities ---- # OK

if [ $UCSC == "yes" ]
then

BLAT_DOWNLOAD_URL="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/blat/blat"
FASPLIT_DOWNLOAD_URL="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faSplit"
PSLSORT_DOWNLOAD_URL="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslSort"
PSLSCORE_DOWNLOAD_URL="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslScore"
PSLCDNAFILTER_DOWNLOAD_URL="http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/pslCDnaFilter"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_ucsc.sh ${BLAT_DOWNLOAD_URL} ${FASPLIT_DOWNLOAD_URL} ${PSLSORT_DOWNLOAD_URL} ${PSLSCORE_DOWNLOAD_URL} ${PSLCDNAFILTER_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_ucsc.log 2> ${LRSDAY_HOME}/soft/Err/install_ucsc.err

fi

printf '████████████████████████████████ (64%%)\r'

# ---- MFANNOT ---- # OK

if [ $MFANNOT == "yes" ]
then


MFANNOT_VERSION="1.35" 
MFANNOT_DOWNLOAD_URL="https://github.com/BFL-lab/MFannot.git"
MFANNOT_GITHUB_COMMIT_VERSION="6472b97"
MFANNOT_DATA_DOWNLOAD_URL="https://github.com/BFL-lab/MFannot_data.git"
MFANNOT_DATA_GITHUB_COMMIT_VERSION="b039ac5"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_mfannot.sh ${MFANNOT_VERSION} ${MFANNOT_DOWNLOAD_URL} ${MFANNOT_GITHUB_COMMIT_VERSION} ${MFANNOT_DATA_DOWNLOAD_URL} ${MFANNOT_DATA_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_mfannot.log 2> ${LRSDAY_HOME}/soft/Err/install_mfannot.err

fi

printf '█████████████████████████████████ (66%%)\r'

# ---- RAPSEARCH ---- # OK

if [ $RAPSEARCH == "yes" ]
then

RAPSEARCH_VERSION="2.24"
RAPSEARCH_DOWNLOAD_URL="https://sourceforge.net/projects/rapsearch2/files/RAPSearch${RAPSEARCH_VERSION}_64bits.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_rapsearch.sh ${RAPSEARCH_VERSION} ${RAPSEARCH_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_rapsearch.log 2> ${LRSDAY_HOME}/soft/Err/install_rapsearch.err

fi

printf '██████████████████████████████████ (68%%)\r'

# ---- TRNASCAN ---- # OK

if [ $TRNASCAN == "yes" ]
then

TRNASCAN_VERSION="1.3.1"
TRNASCAN_DOWNLOAD_URL="http://eddylab.org/software/tRNAscan-SE/tRNAscan-SE.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_trnascan.sh ${TRNASCAN_VERSION} ${TRNASCAN_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_trnascan.log 2> ${LRSDAY_HOME}/soft/Err/install_trnascan.err

fi

printf '███████████████████████████████████ (70%%)\r'

# ---- SNOSCAN ---- # OK

if [ $SNOSCAN == "yes" ]
then

SNOSCAN_VERSION="0.9.1"
SNOSCAN_DOWNLOAD_URL="http://eddylab.org/software/snoscan/snoscan.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_snoscan.sh ${SNOSCAN_VERSION} ${SNOSCAN_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_snoscan.log 2> ${LRSDAY_HOME}/soft/Err/install_snoscan.err

fi

printf '████████████████████████████████████ (72%%)\r'


# ---- REPEATMASKER ---- # OK

if [ $REPEATMASKER == "yes" ]
then

REPEATMASKER_VERSION="open-4-0-7"
REPEATMASKER_DOWNLOAD_URL="http://www.repeatmasker.org/RepeatMasker-${REPEATMASKER_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_repeatmasker.sh ${REPEATMASKER_VERSION} ${REPEATMASKER_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_repeatmasker.log 2> ${LRSDAY_HOME}/soft/Err/install_repeatmasker.err

fi



printf '█████████████████████████████████████ (74%%)\r'


# ---- TRF ---- # OK

if [ $TRF == "yes" ]
then

TRF_VERSION="409"
TRF_DOWNLOAD_URL="http://tandem.bu.edu/trf/downloads/trf${TRF_VERSION}.linux64"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_trf.sh ${TRF_VERSION} ${TRF_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_trf.log 2> ${LRSDAY_HOME}/soft/Err/install_trf.err

fi

printf '██████████████████████████████████████ (76%%)\r'

# ---- REANNOTATE ---- # OK

if [ $REANNOTATE == "yes" ]
then

REANNOTATE_VERSION="17.03.2015-LongQueryName"
REANNOTATE_DOWNLOAD_URL="https://github.com/yjx1217/REannotate_LongQueryName/archive/version_${REANNOTATE_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_reannotate.sh ${REANNOTATE_VERSION} ${REANNOTATE_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_reannotate.log 2> ${LRSDAY_HOME}/soft/Err/install_reannotate.err

fi

printf '███████████████████████████████████████ (78%%)\r'

# ---- CLUSTALW ---- # OK

if [ $CLUSTALW == "yes" ]
then

CLUSTALW_VERSION="2.1"
CLUSTALW_DOWNLOAD_URL="http://www.clustal.org/download/${CLUSTALW_VERSION}/clustalw-${CLUSTALW_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_clustalw.sh ${CLUSTALW_VERSION} ${CLUSTALW_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_clustalw.log 2> ${LRSDAY_HOME}/soft/Err/install_clustalw.err

fi

printf '████████████████████████████████████████ (80%%)\r'

# ---- MUSCLE ---- # OK

if [ $MUSCLE == "yes" ]
then

MUSCLE_VERSION="3.8.31"
MUSCLE_DOWNLOAD_URL="http://www.drive5.com/muscle/downloads${MUSCLE_VERSION}/muscle${MUSCLE_VERSION}_i86linux64.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_muscle.sh ${MUSCLE_VERSION} ${MUSCLE_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_muscle.log 2> ${LRSDAY_HOME}/soft/Err/install_muscle.err

fi

printf '█████████████████████████████████████████ (82%%)\r'

# ---- HMMER ---- # OK

if [ $HMMER == "yes" ]
then

HMMER_VERSION="3.2.1"
HMMER_DOWNLOAD_URL="http://eddylab.org/software/hmmer/hmmer-${HMMER_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_hmmer.sh ${HMMER_VERSION} ${HMMER_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_hmmer.log 2> ${LRSDAY_HOME}/soft/Err/install_hmmer.err

fi

printf '██████████████████████████████████████████ (84%%)\r'

# ---- BAMTOOLS ---- # OK

if [ $BAMTOOLS == "yes" ]
then

BAMTOOLS_VERSION="2.4.2"
BAMTOOLS_DOWNLOAD_URL="https://github.com/pezmaster31/bamtools/archive/v${BAMTOOLS_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_bamtools.sh ${BAMTOOLS_VERSION} ${BAMTOOLS_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_bamtools.log 2> ${LRSDAY_HOME}/soft/Err/install_bamtools.err

fi

printf '███████████████████████████████████████████ (86%%)\r'


# ---- AUGUSTUS ---- # OK

if [ $AUGUSTUS == "yes" ]
then

AUGUSTUS_VERSION="3.2.3"
AUGUSTUS_DOWNLOAD_URL="http://bioinf.uni-greifswald.de/augustus/binaries/old/augustus-${AUGUSTUS_VERSION}.tar.gz"
BAMTOOLS_VERSION="2.4.2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_augustus.sh ${AUGUSTUS_VERSION} ${AUGUSTUS_DOWNLOAD_URL} ${BAMTOOLS_VERSION} > ${LRSDAY_HOME}/soft/Log/install_augustus.log 2> ${LRSDAY_HOME}/soft/Err/install_augustus.err

fi

printf '████████████████████████████████████████████ (88%%)\r'


# ---- EVM ---- # OK

if [ $EVM == "yes" ]
then

EVM_VERSION="1.1.1" # released on 2015.07.03
EVM_DOWNLOAD_URL="https://github.com/EVidenceModeler/EVidenceModeler/archive/v${EVM_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_evm.sh ${EVM_VERSION} ${EVM_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_evm.log 2> ${LRSDAY_HOME}/soft/Err/install_evm.err

fi


# ---- PROTEINORTHO ---- # OK

if [ $PROTEINORTHO == "yes" ]
then

PROTEINORTHO_VERSION="6.0.25"
DIAMOND_VERSION="2.0.6"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_proteinortho.sh ${PROTEINORTHO_VERSION} ${DIAMOND_VERSION} > ${LRSDAY_HOME}/soft/Log/install_proteinortho.log 2> ${LRSDAY_HOME}/soft/Err/install_proteinortho.err

fi

printf '█████████████████████████████████████████████ (90%%)\r'



# ---- EMBOSS ---- # OK

if [ $EMBOSS == "yes" ]
then

EMBOSS_VERSION="6.5.7"
EMBOSS_VERSION_prefix="${EMBOSS_VERSION:0:3}"
EMBOSS_DOWNLOAD_URL="ftp://emboss.open-bio.org/pub/EMBOSS/old/${EMBOSS_VERSION_prefix}.0/EMBOSS-${EMBOSS_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_emboss.sh ${EMBOSS_VERSION} ${EMBOSS_VERSION_prefix} ${EMBOSS_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_emboss.log 2> ${LRSDAY_HOME}/soft/Err/install_emboss.err

fi

# ---- ERPIN ---- # OK

if [ $ERPIN == "yes" ]
then

ERPIN_VERSION="5.5.4"
ERPIN_DOWNLOAD_URL="http://rna.igmors.u-psud.fr/download/Erpin/erpin${ERPIN_VERSION}.serv.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_erpin.sh ${ERPIN_VERSION} ${ERPIN_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_erpin.log 2> ${LRSDAY_HOME}/soft/Err/install_erpin.err

fi

printf '█████████████████████████████████████████████ (91%%)\r'

# ---- TBL2ASN ---- # OK

if [ $TBL2ASN == "yes" ]
then

TBL2ASN_DOWNLOAD_URL="ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_tbl2asn.sh ${ERPIN_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_tbl2asn.log 2> ${LRSDAY_HOME}/soft/Err/install_tbl2asn.err

fi

# ---- PIROBJECT ---- # OK

if [ $PIROBJECT == "yes" ]
then

PIROBJECT_VERSION="1.19" 
PIROBJECT_DOWNLOAD_URL="https://github.com/prioux/PirObject/archive/v${PIROBJECT_VERSION}.tar.gz"
PIRMODELS_GITHUB_COMMIT_VERSION="6b223ec" 
PIRMODELS_DOWNLOAD_URL="https://github.com/BFL-lab/PirModels.git"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_pirobject.sh ${PIROBJECT_VERSION} ${PIROBJECT_DOWNLOAD_URL} ${PIRMODELS_GITHUB_COMMIT_VERSION} ${PIRMODELS_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_pirobject.log 2> ${LRSDAY_HOME}/soft/Err/install_pirobject.err

fi

printf '██████████████████████████████████████████████ (92%%)\r'



# ---- FLIP ---- # OK

if [ $FLIP == "yes" ]
then

FLIP_DOWNLOAD_URL="https://github.com/BFL-lab/Flip.git"
FLIP_GITHUB_COMMIT_VERSION="00a57cb"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_flip.sh ${FLIP_DOWNLOAD_URL} ${FLIP_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_flip.log 2> ${LRSDAY_HOME}/soft/Err/install_flip.err

fi

printf '██████████████████████████████████████████████ (93%%)\r'

# ---- RA ---- #

if [ $RA == "yes" ]
then

RA_DOWNLOAD_URL="https://github.com/rvaser/ra.git ra"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_ra.sh ${RA_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_ra.log 2> ${LRSDAY_HOME}/soft/Err/install_ra.err

fi

# ---- UMAC ---- # OK

if [ $UMAC == "yes" ]
then

UMAC_DOWNLOAD_URL="https://github.com/BFL-lab/Umac.git"
UMAC_GITHUB_COMMIT_VERSION="cae618e"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_umac.sh ${UMAC_DOWNLOAD_URL} ${UMAC_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_umac.log 2> ${LRSDAY_HOME}/soft/Err/install_umac.err

fi

printf '██████████████████████████████████████████████ (94%%)\r'



# ---- HMMSEARCHWC ---- # OK

if [ $HMMSEARCHWC == "yes" ]
then

HMMSEARCHWC_DOWNLOAD_URL="https://github.com/BFL-lab/HMMsearchWC.git"
HMMSEARCHWC_GITHUB_COMMIT_VERSION="9e3b461"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_hmmsearchwc.sh ${HMMSEARCHWC_DOWNLOAD_URL} ${HMMSEARCHWC_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_hmmsearchwc.log 2> ${LRSDAY_HOME}/soft/Err/install_hmmsearchwc.err

fi

# ---- RNAFINDER ---- # OK

if [ $RNAFINDER == "yes" ]
then

RNAFINDER_DOWNLOAD_URL="https://github.com/BFL-lab/RNAfinder.git"
RNAFINDER_GITHUB_COMMIT_VERSION="ee5b7de"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_rnafinder.sh ${RNAFINDER_DOWNLOAD_URL} ${RNAFINDER_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_rnafinder.log 2> ${LRSDAY_HOME}/soft/Err/install_rnafinder.err

fi

# ---- MF2SQN ---- # OK

if [ $MF2SQN == "yes" ]
then

MF2SQN_DOWNLOAD_URL="https://github.com/BFL-lab/Mf2sqn.git"
MF2SQN_GITHUB_COMMIT_VERSION="6faf9f4"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_mf2sqn.sh ${MF2SQN_DOWNLOAD_URL} ${MF2SQN_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_mf2sqn.log 2> ${LRSDAY_HOME}/soft/Err/install_mf2sqn.err

fi

printf '██████████████████████████████████████████████ (95%%)\r'


# ---- GRABFASTA ---- # OK

if [ $GRABFASTA == "yes" ]
then

GRAB_FASTA_DOWNLOAD_URL="https://github.com/BFL-lab/grab-fasta.git"
GRAB_FASTA_GITHUB_COMMIT_VERSION="accd32d"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_grabfasta.sh ${GRAB_FASTA_DOWNLOAD_URL} ${GRAB_FASTA_GITHUB_COMMIT_VERSION} > ${LRSDAY_HOME}/soft/Log/install_grabfasta.log 2> ${LRSDAY_HOME}/soft/Err/install_grabfasta.err

fi

# ---- GATK ---- # OK

if [ $GATK == "yes" ]
then

GATK_DOWNLOAD_URL="https://storage.googleapis.com/gatk-software/package-archive/gatk/GenomeAnalysisTK-3.2-2-gec30cee.tar.bz2"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_gatk3.sh ${GATK_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_gatk3.log 2> ${LRSDAY_HOME}/soft/Err/install_gatk3.err

fi

# ---- CAP ---- # OK

if [ $CAP3 == "yes" ]
then

CAP_DOWNLOAD_URL="https://webdav-r3lab.uni.lu/public/R3lab/IMP/cap3.linux.x86_64.tar"
FILE="cap3.linux.x86_64.tar"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_cap3.sh ${CAP_DOWNLOAD_URL} ${FILE} > ${LRSDAY_HOME}/soft/Log/install_cap3.log 2> ${LRSDAY_HOME}/soft/Err/install_cap3.err

fi

printf '███████████████████████████████████████████████ (96%%)\r'



# ---- MEDAKA ---- # OK

if [ $MEDAKA == "yes" ]
then

MEDAKA_VERSION="1.7.0"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_medaka.sh ${MEDAKA_VERSION} ${MEDAKA_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_medaka.log 2> ${LRSDAY_HOME}/soft/Err/install_medaka.err

fi

printf '████████████████████████████████████████████████ (97%%)\r'

# ---- GNUPLOT ---- # OK

if [ $GNUPLOT == "yes" ]
then

GNUPLOT_VERSION="5.2.2"
GNUPLOT_DOWNLOAD_URL="https://sourceforge.net/projects/gnuplot/files/gnuplot/${GNUPLOT_VERSION}/gnuplot-${GNUPLOT_VERSION}.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_gnuplot.sh ${GNUPLOT_VERSION} ${GNUPLOT_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_gnuplot.log 2> ${LRSDAY_HOME}/soft/Err/install_gnuplot.err

fi

printf '████████████████████████████████████████████████ (98%%)\r'

# ---- MAKER ---- # OK

if [ $MAKER == "yes" ]
then

MAKER_VERSION="3.01.02"
MAKER_DOWNLOAD_URL="https://github.com/Yandell-Lab/maker/archive/refs/tags/Version_${MAKER_VERSION}_r1162.tar.gz"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_maker.sh ${MAKER_VERSION} ${MAKER_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_maker.log 2> ${LRSDAY_HOME}/soft/Err/install_maker.err

fi

printf '█████████████████████████████████████████████████ (99%%)\r'

# ---- NANOPOLISH ---- # OK

if [ $NANOPOLISH == "yes" ]
then

NANOPOLISH_VERSION="0.14.0" #
NANOPOLISH_DOWNLOAD_URL="https://github.com/jts/nanopolish.git"

/usr/bin/time -v bash ${LRSDAY_HOME}/soft/install_nanopolish.sh ${NANOPOLISH_VERSION} ${NANOPOLISH_DOWNLOAD_URL} > ${LRSDAY_HOME}/soft/Log/install_nanopolish.log 2> ${LRSDAY_HOME}/soft/Err/install_nanopolish.err

fi


file1=$LRSDAY_HOME/data/Proteome_DB_for_annotation.CDhit_I95.fa.gz
file2=$LRSDAY_HOME/data/SGDref.PoFF.ffn.gz
file3=$LRSDAY_HOME/data/SGDref.PoFF.faa.gz
file4=$LRSDAY_HOME/data/te_proteins.fasta.gz
file5=$LRSDAY_HOME/Example_Outputs/SK1.assembly.final.fa.gz
file6=$LRSDAY_HOME/Example_Outputs/SK1.final.gff3.gz
file7=$LRSDAY_HOME/Example_Outputs/SK1.final.trimmed_cds.fa.gz
file8=$LRSDAY_HOME/Example_Outputs/SK1.final.cds.fa.gz
file9=$LRSDAY_HOME/Example_Outputs/SK1.final.pep.fa.gz
file10=$LRSDAY_HOME/Example_Outputs/SK1.assembly.final.filter.mummer2vcf.SNP.vcf.gz
file11=$LRSDAY_HOME/Example_Outputs/SK1.assembly.final.filter.mummer2vcf.INDEL.vcf.gz

[ -f $file1 ] && gunzip $file1
[ -f $file2 ] && gunzip $file2
[ -f $file3 ] && gunzip $file3
[ -f $file4 ] && gunzip $file4
[ -f $file5 ] && gunzip $file5
[ -f $file6 ] && gunzip $file6
[ -f $file7 ] && gunzip $file7
[ -f $file8 ] && gunzip $file8
[ -f $file9 ] && gunzip $file9
[ -f $file10 ] && gunzip $file10
[ -f $file11 ] && gunzip $file11

printf '█████████████████████████████████████████████████ (100%%)\r'
echo -en "\n"
echo -en "\n"
sleep 1
printf 'DONE! ＼(＾▽＾)／'
echo -en "\n"
echo -en "\n"
