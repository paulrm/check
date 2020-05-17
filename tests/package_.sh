#!/bin/bash
#Desc: Verifica que el directorio /etc exista
#===============================================================================
#
#        AUTHOR:  Paul
#       COMPANY:  Dissociated Inc
#       VERSION:  1.0
#      REVISION:  ---
#===============================================================================


programname=$0

script=$( basename $programname .sh)

package=$( echo  $script | gawk -F _ '{ print $2 }' )



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
    distro=$(  awk -F= '/^NAME/{print $2}' /etc/os-release | sed 's/ Linux//' )
    if [ ${distro} = "Ubuntu" ]
    then
        ## Comando - Ubuntu
        l=$( dpkg -l $package 2> /dev/null| wc -l )
    else
        ## Comando - NoUbuntu
        l=$( rpm -qi $package 2> /dev/null| wc -l )
    fi
    ## Analisis 
    if [ $l -gt 0 ]
    then
        echo "Ok"
        exit 0
    else
        echo "Not Ok"
        exit 1
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "el paquete $package debe estar instalado"
    exit 0
fi

