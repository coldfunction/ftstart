#!/bin/sh

WORKSPACE=/home/coldfunction/data

#sudo $WORKSPACE/reset.sh
sudo kill -9 $(ps aux | grep qemu | awk '{print $2}')
sudo killall xterm

echo "run primary VM"

#nohup sudo sh -x $WORKSPACE/run_ft &
xterm -T "vm1" -hold -e sudo sh -x $WORKSPACE/run_ft &

sleep 3

echo "run boot.sh"

sudo sh -x $WORKSPACE/boot.sh

sleep 1

echo "run backup VM" 

#if backup node is local
	#if you don't want to show window
	#nohup sudo sh -x $WORKSPACE/recv.sh &
	#show window
	#xterm -e sudo sh -x $WORKSPACE/recv.sh

#if backup node is remote
sh -x sshpass.sh


var=""
while [ -z "$var" ]
do
       var=$(nmap 192.168.11.4 -PN -p ssh | grep open)
       echo "booting..."
       sleep 2
done
echo "connect ok"

echo "enter FT mode"
sudo sh -x $WORKSPACE/ft_mode.sh
