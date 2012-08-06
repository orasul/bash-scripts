#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` [ -c N-M ] file"
}

while getopts :hc: arg
do
  case $arg in
    h)  usage ; exit 0 ;;
    c)  NUMBERS=$OPTARG ;;
  esac
done

#if [ ${#} -le 0 ]
#then
#  usage
#  exit 1
#fi

IFS_OLD=$IFS
IFS=","
count=0

for i in $NUMBERS
do
  count=$(( count+1 ))
  eval N${count}=$i
done

IFS=$IFS_OLD

while read line
do 
  echo ${line:$N1:$N2}
done
