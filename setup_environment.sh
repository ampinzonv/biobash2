#!/bin/bash
# This file sets up the environment for BIOBASH to run. Basically
# it writes a set of environment variables  to .bashrc file.

source lib/shml/shml.sh


#Check that $HOME var is not empty. "-z" means IT IS EMPTY.
if [[ -z "${HOME}" ]];then
	echo "The HOME variable is empty (that's weird!). Please fix this issue before installing BioBash."
	exit 1
fi

#Check that $HOME var is writable (one never knows).
if [ ! -w "${HOME}" ];then
	echo "I can not write to HOME: ${HOME}. Please make sure you have the right permissions."
	exit 1
fi


# If we reached this point HOME is a valid path and it is writable.
# ----- check that  ~/.bashrc file exists ---------

if [[ ! -e "${HOME}/.bashrc" ]];then
	echo "bashrc file is not present, so I will create one for you. This is safe and will not affect your
	system performance or configuration.
	"
	#Flow control. Answer should be "y" or "n"
	continue=0
	until [ $continue  == "y" ] || [ $continue == "n" ]
	do
	    read -p 'Proceed? [y/n]: ' continue
	done

	if [[ $continue == "n" ]]; then
	    echo "
	    Thank you for your interest in BioBash.
	    Nothing done. Quitting installation.
    
	    Bye!
    
	    "
	    exit 0
    
	elif [[ $continue == "y" ]];then
		echo "Creating a brand new .bashrc file just for you!"
		touch ${HOME}/.bashrc 
		echo "#This file was automatically created by BioBash" >> ${HOME}/.bashrc
	else
	    echo "ERROR: Installation can not proceed. Unknown reason."
	    exit 1
	fi
fi


#------------    Check that BIOBASH_HOME is not pre-existent in bashrc   ----------
# To this point there is a .bashrc file, wether just created by this script or previously
# by the user/system.

# Nevertheless is KEY to check if the .bashrc file was previously modified by BioBash and
# variables are already present in that file. This is problematic because a new set of
# variables will be appended and a big conflict can arise from contradicting paths.
# That is way here we check that the current .bashrc file is not holding at least the 
# BIOBASH_HOME variable which is key the root of all other variables.

mod=$(grep -c "BIOBASH_HOME" ${HOME}/.bashrc)
if [[ $mod > 0 ]];then
	echo " 
	$(emoji x) [ERROR]: The BIOBASH_HOME variable is present in your .bashrc file.
	This can be due to a previous BioBash installation. Since appending a new set of variables
	along with the old ones can create a conflict in your system, $(attribute bold 'INSTALLATION WILL BE STOPPED') $(attribute end).
	Please fix your .bashrc file by erasing the whole BioBash section and re-try this installation.
	"
	
	exit 1
fi


#------------      Backup bashrc        ----------
rightNow=$(date +%m-%d-%Y)

echo "
In order to function properly, BioBash requires to modify your $HOME/.bashrc file.
Basically I will append some variables at the end and will not modify your pre-existent
configuration.
Nevertheless I will also create a backup of your actual .bashrc file in the same place where your actual
.bashrc file is. This file will be named: .bashrc_BB.backup.${rightNow}
"
#Flow control. Answer should be "y" or "n"
continue=0
until [ $continue  == "y" ] || [ $continue == "n" ]
do
    read -p 'Proceed? [y/n]: ' continue
done

if [[ $continue == "n" ]]; then
	echo "
	Thank you for your interest in BioBash.
	Nothing done. Quitting installation.
    
	Bye!
    "
	exit 0
    
elif [[ $continue == "y" ]];then
	echo "Creating back up."
	cp $HOME/.bashrc $HOME/.bashrc_BB.backup.${rightNow}
	echo "Done."
else
	 echo "ERROR: Installation can not proceed. Unknown reason."
	 exit 1
fi


#------------    Check OPERAING SYSTEM   ----------
#
# Depending on the OS we are installing we will need to adapt
# the routes to pre-installed binaries and other stuff
#--------------------------------------------------------
if [ `uname` == "Darwin" ]; then
    OS="osx"
    echo "OSX Darwin detected."
elif [ `uname` == "Linux" ];then
    OS="linux"
    echo "Linux OS detected."
else
    echo "
    Impossible to detect the operating system you are installing BioBash on.
    "
    
    myos=0
    
    until [ $myos  == "Linux" ] || [ $myos == "OSX" ]
    do
        read -p 'Please select between: Linux or OSX: ' continue
    done
    #BE CAREFUL here with Linux (capital L) and linux.
    if [[ $myos == "Linux" ]];then
        OS="linux"
    elif [[ $myos == "OSX" ]];then
        OS="osx"
    else
        echo "[ERROR] Unable to detect which Operating System we are working on. Quitting"
        exit 1
    fi
    
fi

#This $1 variable comes from installbiobash script. Basically it is the installDir path +
# biobash version, converted into a directory.
BIOBASH_HOME=$1

BIOBASH_LIB="$BIOBASH_HOME/lib"
BIOBASH_BIN="$BIOBASH_HOME/bin"


SHML_LIB="$BIOBASH_LIB/shml/shml.sh" 
BASHUTILITY_LIB_PATH="$BIOBASH_LIB/bash-utility"
BASHUTILITY_LIB="$BASHUTILITY_LIB_PATH/bash_utility.sh"
BB_NATIVE_LIB_PATH="$BIOBASH_LIB/bb_native"
BB_NATIVE_LIB="$BB_NATIVE_LIB_PATH/bb_native.sh"

if [[ $OS == "linux" ]];then
    BIOBASH_BIN_OS="$BIOBASH_BIN/linux"
fi
if [[ $OS == "Darwin" ]];then
    BIOBASH_BIN_OS="$BIOBASH_BIN/osx"
fi



echo "
#                          - BIOBASH -
# This section was automatically added to your .bashrc file by the
# BIOBASH installer on: ${rightNow}.
# A copy of your original .bashrc file was created with name: .bashrc_BB.backup.${rightNow}

# DO NOT modify below unless you are completely sure what you are doing
# otherwise BIOBASH may not function at all.
#

BIOBASH_HOME="$BIOBASH_HOME"
BIOBASH_LIB="$BIOBASH_LIB" 
BIOBASH_BIN="$BIOBASH_BIN"
BIOBASH_BIN_OS="$BIOBASH_BIN_OS"

SHML_LIB="$SHML_LIB"
BASHUTILITY_LIB_PATH="$BASHUTILITY_LIB_PATH"
BASHUTILITY_LIB="$BASHUTILITY_LIB"
BB_NATIVE_LIB_PATH="$BB_NATIVE_LIB_PATH"
BB_NATIVE_LIB="$BB_NATIVE_LIB"


export BIOBASH_HOME
export BIOBASH_LIB
export BIOBASH_BIN
export BIOBASH_BIN_OS
export SHML_LIB
export BASHUTILITY_LIB_PATH
export BASHUTILITY_LIB
export BB_NATIVE_LIB_PATH
export BB_NATIVE_LIB


export PATH="$BIOBASH_HOME:$BIOBASH_BIN_LINUX:$BIOBASH_BIN_OSX:$PATH"


" >> $HOME/.bashrc

#Make all variables accesible to this shell.
source $HOME/.bashrc

#Create a flag to continue installation
touch environ_ok

exit 0
