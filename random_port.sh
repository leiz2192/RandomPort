#!/usr/bin/env bash


port_start=1025
port_end=65534

while [[ 1 -eq 1 ]]
do
random_num=$(openssl rand -base64 8 | cksum | cut -c1-8)
echo "random_num: ${random_num}"

random_port=$(( ${random_num} % (${port_start} - ${port_end}) + ${port_start} ))
echo "random_port: ${random_port}"

netstat -anp|grep ":${random_port}"
if [[ $? -ne 0 ]]
then
    break
fi
done

