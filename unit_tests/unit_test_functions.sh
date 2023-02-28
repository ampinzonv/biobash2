#!/usr/bin/env bash

# Beautifying outputs
source "$BIOBASH_NATIVE_LIB_PATH/feedback.sh";

#Global vars. Common to all functions.
testData="$BIOBASH_HOME/testdata"
fromFile="Using input file: "
fromSTDIN="Using data from STDIN: "


#Dummy function
test_hello_world() {

    echo "Hello world"
}

#
# Evaluates if the outcome of a given unit test is the desired one.
# $1 result
# $2 Expected outcome
eval_outcome() {

    if [ "$1" -ne "$2" ]; then
        feedback::say "Failed" "error"
    else
        feedback::say "Success!" "success"
    fi
}



test_count_seqs() {

    #Arrange
    feedback::say "...Testing: bb_count_seqs" "notice"
    inputFile=$testData/apoe.fasta
    script=$BIOBASH_BIN/bb_count_seqs
    outcome=1

    #Act
    A=$($script -i $inputFile)
    B=$(cat $inputFile | $script)


    #Assert
    printf "$fromFile"
    eval_outcome $A $outcome

    printf "$fromSTDIN"
    eval_outcome $B $outcome

    echo ""

}


test_extract_subset_from_list() {

    #Arrange
    feedback::say "...Testing: bb_extract_subset_from_list" "notice"
    inputFile=$testData/mets.lst
    script=$BIOBASH_BIN/bb_extract_subset_from_list
    outcome=1
    outcome2=12

    #Act
    A=$($script -i $inputFile -p ADP+ | wc -l)
    B=$(cat $inputFile | $script -p ADP+ -r | wc -l)


    #Assert
    printf "$fromFile"
    eval_outcome $A $outcome

    # Note that we are runnin $B with the "-r" option that is not tested with A.
    # I think it is not necessary to run all the possible options...
    printf "$fromSTDIN"
    eval_outcome $B $outcome2

    echo ""

}




test_get_fasta_headers() {

    #Arrange
    feedback::say "...Testing: bb_get_fasta_headers" "notice"
    inputFile=$testData/apoe.fasta
    script=$BIOBASH_BIN/bb_get_fasta_headers
    outcome=1

    #Act
    A=$($script -i $inputFile | wc -l)
    B=$(cat $inputFile | $script | wc -l)

    #Assert
    printf "$fromFile"
    eval_outcome $A $outcome

    printf "$fromSTDIN"
    eval_outcome $B $outcome

    echo ""

}

test_get_nr_list() {
    #Arrange
    #Act
    #Assert
    break
}

test_sequence_info() {
    #Arrange
    #Act
    #Assert
    break
}
