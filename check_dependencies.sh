#!/bin/bash
#
# Script to check core dependencies necessary for BIOBASH to run.
# These core dependencies are general for all programs or sometimes for some
# of them. Dependencies required for "interfaced" programs (such as blast or EMBOSS) 
# have to be managed in cases by case basis. 
#

#Source libraries necessary to run check process and other stuff.
source lib/bash-utility/src/check.sh
source lib/shml/shml.sh

soft=('gcc' 'zcat' 'wget' 'curl' 'unzip' 'gnuplot' 'xargs')

echo "
Before running BioBash installation I must check that software dependencies are met.
These are basic components that BioBash needs for its functionality. If any of them
is missing BioBash performance will be compromised, so installation should be stopped.

"
echo "Checking external dependencies ( $(color red)$(icon xmark)$(color end) Not installed. $(color green)$(icon check)$(color end) Installed.)"
echo "$(hr)"

notInstalled=0
for i in "${soft[@]}"; do
  
  check::command_exists "$i"

  # Capture function return value. Can be 0 (found),1 (not found) or 
  # 2 (missing arguments)
  status=$?
 
  if (( $status > 0 ));then
  	#At least one dependency is not satisfied 
  	notInstalled=1
	echo "$(color red)$(icon xmark)$(color end) $i."
  fi
  
  if (( $status == 0 ));then
	echo "$(color green)$(icon check)$(color end) $i."	
  fi
done

#If at least one pre-requisite is not met. Stop installation.
if (( $notInstalled > 0 ));then
	
  	echo "
  	Some software dependencies necessary to install BioBash were not found. 
  	Please make sure that all programs marked with a: $(color red)$(icon xmark)$(color end) are correctly installed
  	before installing BioBash.
  	"
	exit 1
else
	echo "
	All dependencies were met. Continue installation.
	"
	#This file is a "flag" for main script, so it can continue the installation.
	touch depend_ok

fi
