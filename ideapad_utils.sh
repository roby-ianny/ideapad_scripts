#!/bin/bash
echo "You have to run this script as root"

echo "Choose an option"
echo "1) Performance Mode"
echo "2) Battery Conservation"
echo "3) Rapid Charge"

read opt

if [ "$opt" -eq 1 ]; then
	echo "Choose perfomance mode"
	echo "1) Battery Saving"
	echo "2) Extreme Performance"
	echo "3) Intelligent Cooling"
	read -p "Enter your choice: " opt
	if [ "$opt" -eq 1 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0013B001' > /proc/acpi/call
	elif [ "$opt" -eq 2 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0012B001' > /proc/acpi/call
	elif [ "$opt" -eq 3 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x000FB001' > /proc/acpi/call
	else
		echo "Invalid option"
	fi
elif [ "$opt" -eq 2 ]; then
	echo "Choose Battery Conservation Mode"
	echo "1) ON"
	echo "2) OFF"
	read -p "Enter your choice: " opt
	if [ "$opt" -eq 1 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' > /proc/acpi/call
	elif [ "$opt" -eq 2 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' > /proc/acpi/call
	else
		echo "Invalid option"
	fi
elif [ "$opt" -eq 3 ]; then
	echo "Choose rapid charge mode"
	echo "1) ON"
	echo "2) OFF"
	read -p "Enter your choice: " opt
	if [ "$opt" -eq 1 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x07' > /proc/acpi/call
	elif [ "$opt" -eq 2 ]; then
		echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x08' > /proc/acpi/call
	else
		echo "Invalid option"
	fi
fi
