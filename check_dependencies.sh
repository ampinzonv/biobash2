#!/bin/bash

source lib/bash-utility/src/check.sh
source lib/shml/shml.sh

soft=('Ab' 'CD' 'embossversion' 'gcc' 'zless' 'wget' 'curl' 'unzip' 'gnuplot')

echo "Checking external dependencies:"

for i in "${soft[@]}"; do
  
  check::command_exists "$i"

  status=$?

  if (( $status > 0 ));then
  	echo "$i command not found"
  fi
 
  #TODO populate not found software array
  #if array is not empty stop installation.
done

