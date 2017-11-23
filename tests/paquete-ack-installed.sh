#!/bin/bash
#Desc: Verifica que el paquete ack este instalado
#===============================================================================
#
# ToDo: Agregar que soporte indistintamente rpm o dpkg
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
    out=$( rpm -qa ack )
    l=$( echo $out | grep ack | wc -l )
    if [ $l -eq 1 ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "paquete ack este instalado"
fi

