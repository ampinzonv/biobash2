#!/usr/bin/env bash

testData="$BIOBASH_HOME/testdata"

test_count_seqs() {


    #Arrange
    inputFile=$testData/apoe.fasta

    #Act
    A=$(bb_count_seqs -i $inputFile)
    B=$(cat $inputFile | bb_count_seqs)

    #Assert
    if [[ "$A" eq 1 ]];then
        
        echo "Passed"

    else
        echo "Not passed."
    fi

}



test_extract_subset_from_list() {

    #Arrange

    #Act

    #Assert

}




test_get_nr_list() {

    #Arrange

    #Act

    #Assert

}
