#!/bin/bash
#Desc: el relay del postfix debe ser a un dominio conocido
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
    postfix_relay=$( cat /etc/postfix/main.cf | grep -v "^#" | grep "\[mail-server.invap.com.ar\]" | gawk '{ print $3 }' )
    if [ "$postfix_relay" = "[mail-server.invap.com.ar]" ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "el relay del postfix debe ser a un dominio conocido"
fi

