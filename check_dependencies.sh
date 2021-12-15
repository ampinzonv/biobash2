#!/bin/bash

source lib/bash-utility/src/check.sh
source lib/shml/shml.sh

soft=('Ab' 'blastp' 'embossversion' 'gcc' 'zcat' 'wget' 'curl' 'unzip' 'gnuplot')

echo "Checking external dependencies:"

for i in "${soft[@]}"; do
  
  check::command_exists "$i"

  # Capture function return value. Can be 0 (found),1 (not found) or 
  # 2 (missing arguments)
  status=$?

  if (( $status > 0 ));then
  	echo "$i seems to be not installed and it is required by BioBash."
  fi
 
  #TODO populate not found software array
  #if array is not empty stop installation or suggest instalaltion using APT or so.
done

