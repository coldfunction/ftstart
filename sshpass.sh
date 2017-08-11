#! /bin/bash

xterm -T "backup VM" -hold -e sshpass -p yourpasswd ssh -o StrictHostKeyChecking=no -X coldfunction@192.168.11.222 "sudo killall qemu-system-x86_64; cd data; sudo sh -x ./recv_ft" &
