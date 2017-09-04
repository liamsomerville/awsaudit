#!/bin/bash

rdp=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=3389 Name=ip-permission.to-port,Values=3389 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

cifs=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=445 Name=ip-permission.to-port,Values=445 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

dns=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=53 Name=ip-permission.to-port,Values=53 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

ftp=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=20,21 Name=ip-permission.to-port,Values=20,21 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

icmp=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.protocol,Values=icmp Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

mongodb=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=27017 Name=ip-permission.to-port,Values=27017 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

mssql=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=1433 Name=ip-permission.to-port,Values=1433 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}' |grep 'Name'|cut -c18- |sed 's/[",]//g')

mysql=$(aws ec2 describe-security-groups --region us-east-1	--filters Name=ip-permission.from-port,Values=3306 Name=ip-permission.to-port,Values=3306 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

oracle=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=1521 Name=ip-permission.to-port,Values=1521 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')


postgressql=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=5432 Name=ip-permission.to-port,Values=5432 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

netbios=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=137,138,139 Name=ip-permission.to-port,Values=137,138,139 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

rpc=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=135 Name=ip-permission.to-port,Values=135 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

smtp=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=25 Name=ip-permission.to-port,Values=25 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

ssh=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=22 Name=ip-permission.to-port,Values=22 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

telnet=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.from-port,Values=23 Name=ip-permission.to-port,Values=23 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'|grep 'Name'|cut -c18- |sed 's/[",]//g')

uncommon=$(aws ec2 describe-security-groups --region us-east-1 --filters Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].GroupId'|grep 'Name'|cut -c18- |sed 's/[",]//g')

expiredcerts=$(aws acm list-certificates --region us-east-1 --certificate-statuses EXPIRED)



clear
echo "============================================="
echo "============================================="
echo  = "Security groups with unrestricted access  ="
echo "============================================="
echo "============================================="
echo
echo -e "Unrestricted RDP Access\n==========================="
echo $rdp
echo
echo
echo -e "Unrestricted CIFS Access\n==========================="
echo $cifs
echo
echo
echo -e "Unrestricted DNS Access\n==========================="
echo $dns
echo
echo
echo -e "Unrestricted FTP Access\n==========================="
echo $ftp
echo
echo
echo -e "Unrestricted ICMP Access\n==========================="
echo $icmp
echo
echo
echo -e "Unrestricted MongoDB Access\n==========================="
echo $mongodb
echo
echo
echo -e "Unrestricted MSSQL Access\n==========================="
echo $mssql
echo
echo
echo -e "Unrestricted Oracle Database Access\n==========================="
echo $oracle
echo
echo
echo -e "Unrestricted Postgres Access\n==========================="
echo $postgressql
echo
echo
echo -e "Unrestricted NetBIOS Access\n==========================="
echo $netbios
echo
echo
echo -e "Unrestricted RPC Access\n==========================="
echo $rpc
echo
echo
echo -e "Unrestricted RPC Access\n==========================="
echo $smtp
echo
echo
echo -e "Unrestricted SSH Access\n==========================="
echo $ssh
echo
echo
echo -e "Unrestricted Telnet Access\n==========================="
echo $telnet
echo
echo
echo -e "Unrestricted Uncommon Access\n==========================="
echo $uncommon
echo
echo
echo "============================================="
echo "============================================="
echo "             ACM Expired Certificates       ="
echo "============================================="
echo "============================================="
echo $expiredcerts

