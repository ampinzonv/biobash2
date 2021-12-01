#!/usr/bin/env bash

p=$(realpath $0)
dir=$(dirname $p)/lib/bash-utility

# shellcheck disable=SC1091
source $dir/src/array.sh
source $dir/src/string.sh
source $dir/src/variable.sh
source $dir/src/file.sh
source $dir/src/misc.sh
source $dir/src/date.sh
source $dir/src/interaction.sh
source $dir/src/check.sh
source $dir/src/format.sh
source $dir/src/collection.sh
source $dir/src/json.sh
source $dir/src/terminal.sh
source $dir/src/validation.sh
source $dir/src/debug.sh
source $dir/src/os.sh


