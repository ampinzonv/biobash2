#!/bin/bash
# This file sets up the environment for BIOBASH to run. Basically
# it writes a set of environment variables  to .bashrc file.

echo "

Setting up environment. This will modify your $HOME/.bashrc file.

"

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
#check that  ~/.bashrc file exists
if [[ ! -e "${HOME}/.bashrc" ]];then
	echo "bashrc file is not present, so I will create one for you."
	touch ${HOME}/.bashrc
fi

# If bashrc file is present, let's backup the actual .bashrc file
echo "A 'bashrc' file was found at $HOME. I will make a backup of your actual file with
the extension '_BB.backup'."

rightNow=$(date +%m-%d-%Y)
cp $HOME/.bashrc $HOME/.bashrc_BB.backup.${rightNow}


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
SHML_LIB="$SHML_LIB"
BASHUTILITY_LIB_PATH="$BASHUTILITY_LIB_PATH"
BASHUTILITY_LIB="$BASHUTILITY_LIB"
BB_NATIVE_LIB_PATH="$BB_NATIVE_LIB_PATH"
BB_NATIVE_LIB="$BB_NATIVE_LIB"


export BIOBASH_HOME
export BIOBASH_LIB
export BIOBASH_BIN
export SHML_LIB
export BASHUTILITY_LIB_PATH
export BASHUTILITY_LIB
export BB_NATIVE_LIB_PATH
export BB_NATIVE_LIB

" >> $HOME/.bashrc

#Make all variables accesible to this shell.
source $HOME/.bashrc
exit 0