#!/usr/bin/env bash
#
# This is a library for comon validation of files, directories etc.
#
#

validate::isFasta()
{
    declare fastaFile=$1

    if [ "$(grep -c "^>" $fastaFile)" -ge 1 ]; then
        status="true"
    else
        status="false"
    fi

    #return
    echo $status
}

validate::isMultipleFasta()
{
    declare fastaFile=$1

    if [ "$(grep -c "^>" $fastaFile)" -ge 2 ]; then
        status="true"
    else
        status="false"
    fi

    #return
    echo $status
}

validate::isFastq()
{
    echo ""
    #tomar la primera linea

    # ver si comienza con un "@"
}

validate::itExists()
{
    echo ""
}

validate::isWritable()
{
    echo ""
}


#validates input, wether it comes from STDIN, $1 or by a parameter such as "-i"
validate::getInput()
{

    echo ""

}