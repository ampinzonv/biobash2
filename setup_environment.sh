#!/bin/bash
# This file sets up the environment for BIOBASH to run. Basically
# it writes a set of environment variables  to .bashrc file.

echo "

Setting up environment. This will modify your $HOME/.bashrc file.

"

#Check that $HOME var is not empty
#todo

#check that  .bashrc file exists
#todo

#backup .bashrc file
#todo


BIOBASH_HOME=$1

BIOBASH_LIB="$BIOBASH_HOME/lib"

SHML_LIB="$BIOBASH_LIB/shml/shml.sh" 
BASHUTILITY_LIB_PATH="$BIOBASH_LIB/bash-utility"
BASHUTILITY_LIB="$BASHUTILITY_LIB_PATH/bash_utility.sh"
BB_NATIVE_LIB_PATH="$BIOBASH_LIB/bb_native"
BB_NATIVE_LIB="$BB_NATIVE_LIB_PATH/bb_native.sh"

rightnow=$(date +%m-%d-%Y)

echo "
#
# This section was automatically added to your .bashrc file by the
# BIOBASH installer on: ${rightnow}.
# A copy of your original .bashrc file was created with name: .bashrc_${rightnow}

# DO NOT modify below unless you are completely sure what you are doing
# otherwise BIOBASH may not function at all.
#

BIOBASH_HOME="$BIOBASH_HOME"
BIOBASH_LIB="$BIOBASH_LIB" 
SHML_LIB="$SHML_LIB"
BASHUTILITY_LIB_PATH="$BASHUTILITY_LIB_PATH"
BASHUTILITY_LIB="$BASHUTILITY_LIB"
BB_NATIVE_LIB_PATH="$BB_NATIVE_LIB_PATH"
BB_NATIVE_LIB="$BB_NATIVE_LIB"


export $BIOBASH_HOME
export $BIOBASH_LIB
export $SHML_LIB
export $BASHUTILITY_LIB_PATH
export $BASHUTILITY_LIB
export $BB_NATIVE_LIB_PATH
export $BB_NATIVE_LIB

" >> $HOME/.bashrc
