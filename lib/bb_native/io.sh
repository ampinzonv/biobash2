#!/usr/bin/env bash

# @file io
# @brief Functions for handling input/output


#####################################################################
# @description Evaluates if the script receives at least one argument
# @Description
#
# @arg $1  Bash "$#" special character.
# @return FALSE (string) if script has at least one argument.
#####################################################################
io::script_has_args(){
    local args
    #By default we expect arguments
    args="TRUE"
    # When script is called without arguments.
    if [[ $1 -eq 0 ]]; then 
        args="FALSE"
    fi
    
    echo "$args"
}


#####################################################################
# @description Evaluates if input comes from a pipe or a file
# @Description
#
# @noargs
#####################################################################
io::input_is_pipe(){


    #True means that data comes from a pipe "|".

    if [ ! -t 0 ]; then
        pipe="TRUE"
    else
        pipe="FALSE"
    fi
    echo $pipe
}