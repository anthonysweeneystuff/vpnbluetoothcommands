#! /usr/bin/bash

#bluetoothctl pairing with headphones
bluetooth(){
if [ "$1" == "down" ]
then
    bluetoothctl power off
    bluetoothctl disconnect 08:EB:ED:B0:9D:5B
else
    bluetoothctl power on
    bluetoothctl connect 08:EB:ED:B0:9D:5B
fi
}

#wireguard home VPN commands
vpn(){
if [ "$1" == "down" ]
then
    wg-quick down system
else
    wg-quick up system
fi
}

#home vpn and bluetooth connection
if [ "$1" == "" ]
then
    vpn 
    bluetooth

#vpn d/c
elif [ "$1" == "-vd" ]
then
     vpn down

#vpn connect    
elif [ "$1" == "-vu" ]
then
     vpn

#bluetooth d/c    
elif [ "$1" == "-bd" ]
then
    bluetooth down 
     
#bluetooth connect    
elif [ "$1" == "-bu" ]
then
    bluetooth

#vpn and bluetooth d/c
elif [ "$1" == "-k" ]
then
    vpn down
    bluetooth down

else
     echo Invalid flag
fi



