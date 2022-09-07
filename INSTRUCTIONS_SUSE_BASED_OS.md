[**LRSDAY**](https://github.com/yjx1217/LRSDAY) performes chromosome-level end-to-end genome assembly and comprehensive annotations for *Saccharomyces* yeasts.
The instructions that follow help to meet the dependencies on SUSE-based OS for [**LRSDAY v.1.6**](https://github.com/yjx1217/LRSDAY/releases/tag/v1.6.0). </br>

### Step 0: Download LRSDAY

After the download of [**LRSDAY**](https://github.com/yjx1217/LRSDAY) remove ```Project_Template``` and copy the content of **LRSDAY-Patch** inside LRSDAY folder.</br>

——

### Step 1: PRE-installation
The following dependecies have been tested on a virgin virtual copy of OpenSUSE Leap 15.4. They represent the minimum indispensable dependecies to successfully install the pipeline. Please, consider if you want to change the repositories to fit with your Leap version.
In order to complete the installation of **LRSDAY** install the following packages:

```
 sudo zypper install cmake make gcc git zlib-devel libbz2-devel libz1
```

**Bioperl**:

```
zypper addrepo https://mirror-jp.firstyear.id.au/repositories/devel:/languages:/perl/openSUSE_Leap_15.2/devel:languages:perl.repo
zypper refresh
zypper install perl-BioPerl
```

General packages: 

```
sudo zypper install perl-Text-Soundex liblzma5 pkg-config autoconf hdf5-devel postgresql-devel libpqxx
```

**Python3**: 

```
sudo zypper addrepo https://download.opensuse.org/repositories/devel:/languages:/python/15.4/devel:languages:python.repo
zypper refresh
zypper install python3
```

The *"build essential"* for SUSE OS:

```
sudo zypper install -t pattern devel_basis
```

Additional general packages:

```
sudo zypper install curl libcurl-devel libcurl4 lzma-devel
```

Install ```java 8``` for **GATK3**: 

```
sudo zypper install java-1_8_0-openjdk
```

set java 8 as default: 

```
sudo update-alternatives --config java
```

type the number corresponding to ```jre-1.8.0-openjdk```.

run ``` java -version``` to visualize the change:

```
openjdk version "1.8.0_345"
[troncated output]
```

In addition, you have to meet the dependecies indicated in [prerequisites](https://github.com/yjx1217/LRSDAY/blob/master/prerequisite.txt).</br>
Sotware with [S] are already provided with the installation of OpenSUSE. 

```
bash [S]
bzip2 [S] and libbz2-devel
cmake v3.2 or newer
gcc and g++ v4.9.1 or newer 
ghostscript [S]
git 
make
gzip [S]
java runtime environment (JRE) v1.8.0 
perl v5.12 or newer [S]
python v2.7 [S] 3.6 [S] 3.8 
python-dev
python3-dev
tar [U]
unzip [U]
wget [U]
zlib and zlib-dev
```
——

### Step 2: Installation

Edit ```installer_patch.sh```, set ```SUSE="yes"``` and run the command: 

```
bash installer_patch.sh
```
By default, you are going to install all the software listed at the beginning of the installer (suggested if you are not familiar with the pipeline). This behavior can be modified based on errors that may occur along the process. Hence, if you need to repeat the installattion for a group of software, you can change the variable to all the others to "no". The installation time depends on the internet connection and varies between 30 and 50/55 min.

——

### Step 2b: MAKER

Move in ```LRSDAY/soft/Err``` and run ```grep DBD *```; if ```install_maker.err: * DBD::Pg is not installed``` install maker manually, find all the steps in ```LRSDAY/soft/install_maker.sh```. Rimind to run ```./Build installdeps``` before ```./Build install```.

### Step 3: POST-Installation

Move inside ```LRSDAY/soft/Err``` and run: 

```
grep Exit *
```
If you see ```Exit status 0``` you can move to the next step.

```
grep Error *
grep error *
grep ERROR *
```
If ```grep``` commands return empty, you are ready to run **LRSDAY** tutorial from the manual!</br>
**NOTE**: some software may return compilation errors that are not fatal. Only running the pipeline we can understand if it is necessary to look back at the installation of the software. 

——

### Step 4: Debugging and further help

If ```grep``` commands return non-empty results, you got an error and we have to fix it. Feel free to open an issue at https://github.com/nicolo-tellini/LRSDAY-UbuntuOS/issues with the content of the ```install_*_.err``` file in which the error occurred. I am going to help you to fix the error.
