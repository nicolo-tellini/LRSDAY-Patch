# LRSDAY Debian-based OS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Patch for LRSDAY v1.6 © Jia-Xing Yue for Debian-based OS.
The debugging was performed with **Ubuntu 18.04**.

### Content
:open_file_folder: :

 - ```installer_LRSDAY_UOS.sh```: a redesigned installer that simplify the process of debugging,</br>
 - ```soft```: a dir that contains individual installation scripts for the software and collects ```Log``` and ```Err``` files, </br>
 - ```Project_Template```: a dir that contains the scripts to run LRSDAY modules <sup>[note]</sup>,</br>
 - ```INSTRUCTIONS.md```: a file with the instructions.</br>

<sup>[note]</sup> the scripts do not significatly change in the content. Only paths and option/function names have been adjusted to meet the requirements of both up and downgraded software. 
 
 Other files:
- ```SOFTWARECHANGES.md```: a list of up/downgraded software <sup>[note]</sup> ,
- ```installer_patch_LRSDAY.jpg```: the picture in the README.md,
- ```LICENSE.md```: the license,
- ```CITATION.cff```: the citation info.

<sup>[note]</sup> If you are going to use **nanopolish** consider to take a look to the comments at the beginning of the installer. The compilation of nanopolish fails and, because of this, the installation is skipped by default.  

### Installer

How the *new* installer acts:

<p align="center">
  <img src="https://github.com/nicolo-tellini/LRSDAY-UbuntuOS/blob/main/installer_patch_LRSDAY.jpg" />
</p>

### Commitment

:heavy_check_mark: We monitor the link integrity of each software by means [**LICO**](https://github.com/nicolo-tellini/LICO)<sup>1</sup>, **monthly**.

[1] Nicolò, T. (2022). LInk COntroller (LICO) (Version 1.0) [Computer software]. https://github.com/nicolo-tellini/LICO

:heavy_check_mark: We have been testing LRSDAY on Fedora 36 (RedHat) and OpenSUSE Leap 15.4 (SUSE), stay tuned.

### Citation 

:page_facing_up: Please, if you use this patch cite this GitHub repo along with [LRSDAY](https://github.com/yjx1217/LRSDAY#citations).
Thank you very much!

### Disclaimer

:heavy_exclamation_mark: **FOLLOWING THE INSTRUCTION YOU ARE GOING TO INSTALL PACKAGES WITH SUPERUSER PRIVILEGES DURING THE PRE-INSTALLATION PROCESS. IF YOU ARE NOT AWARE OF WHAT YOU ARE DOING CONSULT WITH EITHER YOUR SYSTEM ADMINISTRATOR OR SENIOR BIO/INFORMATICIAN. NO SUPERUSER PRIVILEGES ARE REQUIRED BY THE MAIN SOFTWARE INSTALLER.**
