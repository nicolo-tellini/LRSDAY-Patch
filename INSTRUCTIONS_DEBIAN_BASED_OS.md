# Ubuntu, Mint and other Debian based distributions (APT)

[**LRSDAY**](https://github.com/yjx1217/LRSDAY) performes chromosome-level end-to-end genome assembly and comprehensive annotations for *Saccharomyces* yeasts.
The instructions that follow help to meet the dependencies on Debian-based OS for [**LRSDAY v.1.6**](https://github.com/yjx1217/LRSDAY/releases/tag/v1.6.0). </br>

### Step 0: Download LRSDAY

After the download of [**LRSDAY**](https://github.com/yjx1217/LRSDAY) remove ```Project_Template``` and git clone **LRSDAY-Patch** inside LRSDAY folder.</br>

 ```
cd LRSDAY-Patch/
```

and move LRSDAY-Patch content one dir back:

 ```
mv * ../
```


——

### Step 1: PRE-installation
The following dependecies have been tested on a virgin virtual copy of Ubuntu 18.04. They represent the minimum indispensable dependecies to successfully install the pipeline. 
In order to complete the installation of **LRSDAY** install the following packages:

 ```
 sudo apt-get install libbio-perl-perl
```

this will results in the installation of ```Bioperl```.

A package required for **RepeatMasker**:

```
 sudo apt-get install libtext-soundex-perl
```
A package required for **cpanm**:
```
 sudo apt-get install libpq-dev
```
A package required for **bedtools2**:
```
 sudo apt-get install liblzma-dev
```
A package required for **samtools**:
```
 sudo apt-get install pkg-config
```
Packages required for **marginpolish**:
```
sudo apt-get install libhdf5-openmpi-dev autoconf libhdf5-dev
```

Install ```python3.8```:

```
 sudo apt-get install python3.8
```

Install ```java 8``` for **GATK3**: 

```
sudo apt install openjdk-8-jdk
```

set java 8 as default: 

```
sudo update-alternatives --config javac
```

type the number corresponding to ```java-8-openjdk-* ```.

runn ``` java -version``` to visualize the change:

```
openjdk version "1.8.0_302"
OpenJDK Runtime Environment (build 1.8.0_302-8u302-b08-0ubuntu2-b08)
OpenJDK 64-Bit Server VM (build 25.302-b08, mixed mode)
```

In addition, you have to meet the dependecies indicated in [prerequisites](https://github.com/yjx1217/LRSDAY/blob/master/prerequisite.txt).</br>
Sotware with [U] are already provided with the installation of Ubuntu. 

```
bash [U]
bzip2  [U] and libbz2-dev 
cmake v3.2 or newer
gcc [U] and g++ v4.9.1 [U] or newer 
ghostscript [U]
git 
gnu make [U]
gzip [U]
java runtime environment (JRE) v1.8.0 
perl v5.12 or newer [U]
python v2.7 [U] 3.6 [U] 3.8 
python-dev
python3-dev
tar [U]
unzip [U]
virtualenv v15.1.0 or newer
wget [U]
zlib and zlib-dev (sudo apt install zlib1g zlib1g-dev)
```
——

### Step 2: Installation

run the command: 
```
bash installer_patch.sh
```
By default, you are going to install all the software listed at the beginning of the installer (suggested if you are not familiar with the pipeline). This behavior can be modified based on errors that may occur along the process. Hence, if you need to repeat the installattion for a group of software, you can change the variable to all the others to "no". The installation time depends on the internet connection and varies between 30 and 50/55 min.

——

### Step 3: POST-Installation

Move inside ```LRSDAY/soft/Err``` and run: 

```
grep Exit *
```
If you see ```Exit status 0``` you can move to the next step.

```
grep -w Error *
grep -w error *
grep -w ERROR *
```
If ```grep``` commands return empty, you are ready to run **LRSDAY** tutorial from the manual!

——

### Step 4: Debugging and further help

If ```grep``` commands return non-empty results, you got an error and we have to fix it. Feel free to open an issue at https://github.com/nicolo-tellini/LRSDAY-UbuntuOS/issues with the content of the ```install_*_.err``` file in which the error occurred. I am going to help you to fix the error.
