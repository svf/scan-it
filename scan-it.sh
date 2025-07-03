#! /bin/bash

########################################
# Author: Scott Vranesh-Fallin         #
# Date:   2025-07-02                   #
########################################

# set result variables
raw_results=/tmp/raw_results
grepped_results=/tmp/grepped_results

# create the results files, if they don't already exist
touch $raw_results
touch $grepped_results

# Enter the starting IP address
echo "Enter the starting IP address : "

# read keyboard input and store it in a variable
read first_ip

# Enter the last octet of the last IP
echo "Enter the last octet of the last IP address : "

# read keyboard input and store it in a variable
read last_octet_ip

# Enter the nubmer of the port you are scanning for
echo "Enter the port number you want to scan for : "

# read keyboard input and store it in a variable
read port

# scan the user defined IP range and store the results in a file
nmap -sT $first_ip-$last_octet_ip -p $port >/dev/null -oG $raw_results

# look through the raw results for listings of open ports and store in file
cat $raw_results | grep open > $grepped_results

# display the grepped results to screen
cat $grepped_results




