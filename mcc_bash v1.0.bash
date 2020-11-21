#!/bin/bash
echo 
echo do not re name this program or else it will not run
echo 
echo run it as sudo su
echo
sudo echo
 #try bolck
echo this mac adress changer is created by us
cdi=$(pwd)
echo
echo $cdi
echo
echo enter the interface eg wlan0,eth0,lo,etc...
echo
read infa
echo
card=$(ifconfig $infa | grep ether)

if [[ $? == 0 ]]
    then
    echo $card
    echo 
    echo enter the 6 point mac adress eg 00:11:22:33:44:55 same like this
    echo
    echo or to randamizer the macc address press R or r
    echo
    read add
    echo
    echo 
    r="r"
    R="R"
    
    if [[ "$add" == "$r" || "$add" == "$R" ]]
        then
        a=$((($RANDOM % 80)+10))
        b=$((($RANDOM % 80)+10))
        c=$((($RANDOM % 80)+10))
        d=$((($RANDOM % 80)+10))
        e=$((($RANDOM % 80)+10)) 
        f=$((($RANDOM % 80)+10))
        ifconfig $infa down
        ifconfig $infa hw ether $a:$b:$c:$d:$e:$f
        while [[ $? -ne '0' ]]
            do
            echo dont worry trying again
            a=$((($RANDOM % 80)+10))
            b=$((($RANDOM % 80)+10))
            c=$((($RANDOM % 80)+10))
            d=$((($RANDOM % 80)+10))
            e=$((($RANDOM % 80)+10))
            f=$((($RANDOM % 80)+10))
            ifconfig $infa hw ether $a:$b:$c:$d:$e:$f 
        done
        echo
        echo now ur mac is changed
        echo
        ifconfig $infa up
        echo         mac add of $infa old mac add was 
        echo $card 
        echo         now new = $a:$b:$c:$d:$e:$f
        echo
        ifconfig $infa
        echo
    else
        ifconfig $infa down
        ifconfig $infa hw ether $add
        if [[ $? != 0 ]]
            then
            echo you have enter an invalid option
            echo
            echo enter a valid option 
            $cdi/mcc_asd.bash
        fi
        ifconfig $infa up
        echo now ur mac add of $infa is $add 
        echo
        ifconfig $infa
        echo
       
    fi
else
    
    
    echo you have enter an invalid option
    echo
    echo enter a valid option 
    $cdi/mcc_asd.bash
fi
