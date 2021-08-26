# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: avitolin <avitolin@student.42wolfsburg.de> +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/25 22:16:07 by avitolin          #+#    #+#              #
#    Updated: 2021/08/25 22:26:58 by avitolin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#!/bin/bash

# The architecture of your operating system and its kernel version
architecture=$(uname -a)

# The number of physical processors
phisical_cpu=$(grep "physical id" /proc/cpuinfo | sort | uniq -c | awk '{print $1}')

# The number of virtual processors
virtual_cpu=$(grep "processor" /proc/cpuinfo | wc -l)

# The current available RAM on your server and its utilization rate as a percentage.
free_ram=$(free -m | awk '$1 == "Mem:" {print $2}')
used_ram=$(free -m | awk '$1 == "Mem:" {print $3}')
percent_ram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# The current available memory on your server and its utilization rate as a percentage.
free_disk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
used_disk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
percent_disk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')

# The current utilization rate of your processors as a percentage.
cpu_usage=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

# The date and time of the last reboot.
last_reboot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# Whether LVM is active or not.
lvm_temp=$(lsblk | grep "lvm" | wc -l)
lvm_usage=$(if [ $lvm_temp -eq 0 ]; then echo no; else echo yes; fi)

# The number of active connections.
active_connections=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')

# The number of users using the server.
users_logged_in=$(users | wc -w)

# The IPv4 address of your server and its MAC (Media Access Control) address.
ip_adress=$(hostname -I | awk '{print $1}')
mac=$(ifconfig | grep "ether" | awk '$1 == "ether" {print $2}')

#  The number of commands executed with the sudo program.
sudo_commands=$(grep "COMMAND" /var/log/sudo/sudo_log | wc -l) # journalctl should be running as sudo but our script is running as root so we don't need in sudo here

# broadcast our system information on all terminals
wall "#Architecture: $architecture
	#CPU physical: $phisical_cpu
	#vCPU: $virtual_cpu
	#Memory Usage: $used_ram/${free_ram}MB ($percent_ram%)
	#Disk Usage: $used_disk/${free_disk}Gb ($percent_disk%)
	#CPU load: $cpu_usage
	#Last boot: $last_reboot
	#LVM use: $lvm_usage
	#Connexions TCP: $active_connections ESTABLISHED
	#User log: $users_logged_in
	#Network: IP $ip_adress ($mac)
	#Sudo: $sudo_commands cmd" 
