 [**LRSDAY**](https://github.com/yjx1217/LRSDAY) performes chromosome-level end-to-end genome assembly and comprehensive annotations for *Saccharomyces* yeasts.</br>
The instructions that follow help to meet the dependencies on Ubuntu OS for [**LRSDAY v.1.6**](https://github.com/yjx1217/LRSDAY/releases/tag/v1.6.0). </br>

### Download LRSDAY

After the download of [**LRSDAY**](https://github.com/yjx1217/LRSDAY) remove ```Project_Template``` and copy the content of **LRSDAY-UbuntuOS** inside LRSDAY folder.</br>

### Pre-installation

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

Allow full persmissions of ```.cpan``` and ```.cpanm``` in ```$HOME``` for user and group :

```
 sudo chmod -R ug+rwx .cpan
 sudo chmod -R ug+rwx .cpanm
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
sudo update-alternatives --config java
```

type the number corresponding to ```java-8-openjdk-* ```.

runn ``` java -version``` to visualize the change:

```
openjdk version "1.8.0_302"
OpenJDK Runtime Environment (build 1.8.0_302-8u302-b08-0ubuntu2-b08)
OpenJDK 64-Bit Server VM (build 25.302-b08, mixed mode)
```

In addition, you have to meet the dependecies indicated in [prerequisites](https://github.com/yjx1217/LRSDAY/blob/master/prerequisite.txt).

```
# sotwares with [U] are already provided with the installation of Ubuntu. 
bash [U]
bzip2 and libbz2-dev [U]
cmake v3.2 or newer [U]
gcc and g++ v4.9.1 or newer [U]
ghostscript [U]
git [U]
gnu make [U]
gzip [U]
java runtime environment (JRE) v1.8.0 
perl v5.12 or newer
python v2.7.9 [U] 3.6 [U] 3.8 
python-devel
python3-devel
tar [U]
unzip [U]
virtualenv v15.1.0 or newer [U]
wget [U]
zlib and zlib-devel [U]
```
