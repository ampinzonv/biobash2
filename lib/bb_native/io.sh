#!/usr/bin/env bash

# @file io
# @brief Functions for handling input/output


#####################################################################
# @description Evaluates if input comes empty
# @Description
#
# @noargs
#####################################################################
io::input_is_empty(){
        local input

    # When script is called without arguments.
    if [[ $# -eq 0 && -t 0 ]]; then 
        input="empty"
    fi
    echo $input
}

#####################################################################
# @description Evaluates if input comes from a pipe or a file
# @Description
#
# @noargs
#####################################################################
io::input_is_pipe_or_file(){


    #True means that STDIN is connected to the terminal yet. So no pipe
    #has been used to redirect STDIN.
    if [ -t 0 ]; then
        input="file"
    else
        input="pipe"
    fi
    echo $input
}