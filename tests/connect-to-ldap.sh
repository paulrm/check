#!/bin/bash
#Desc: Verifica conectividad con ldap
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
    #

    #
    l=$( ldapsearch -h 125.1.40.133 \
            -l 5 \
            -D "cn=ldapuser,ou=sistemas,o=invap" \
            -w "l1d2a3p4" \
            -b "o=invap"             \
            -x "(cn=PMessina)" | grep "eMailAddress:" 2>/dev/null | wc -l )
    if [ $l -gt 0 ]
    then
       echo "Ok"
    else
        echo "Not Ok"
    fi
fi

if [ $DOFlag = "show" ]
then
    echo "Verifica conectividad con ldap"
fi

