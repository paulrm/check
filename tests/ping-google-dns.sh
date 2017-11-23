#!/bin/bash
#Desc: Verifica conectividad a DNS de Google en menos de 1 seg
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
    ping -c 1 -w 1 8.8.8.8 > /dev/null 2>&1  
     cc=$?
    if [ $cc -eq 0 ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "acceso a Intenet - ping 8.8.8.8"
fi

