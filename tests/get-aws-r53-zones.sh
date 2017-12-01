#!/bin/bash
#Desc: Verifica obtener aws route53 zones
#===============================================================================
#
#        AUTHOR:  Paul
#       COMPANY:  Dissociated Press
#       VERSION:  1.0
#      REVISION:  ---
#===============================================================================


programname=$0

function usage {
    echo "usage: $programname [-s] [-e]"
    echo "  -s      show the test"
    echo "  -e      execute the test"
    exit 1
}
if [ $# -eq 1 ]
then 
    if [ $1 = "-s" ]
    then 
        DOFlag="show"
    else
        DOFlag="do"
    fi
else
    usage
fi

if [ $DOFlag = "do" ]
then 
    out=$( aws route53 list-hosted-zones   --output text | gawk '/neuroglia/ { print $4 }' )
    if [ "$out" = "neuroglia.com.ar." ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "Verifica obtener aws route53 zones"
fi

