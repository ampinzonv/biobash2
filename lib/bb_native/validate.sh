#!/usr/bin/env bash

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