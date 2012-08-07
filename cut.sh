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

# NUMBERS - should be parsed, as it can contain "-" and ","

##IFS_OLD=$IFS
#IFS=","
#count=0
#
#for i in $NUMBERS
#do
#  count=$(( count+1 ))
#  eval N[$count]=$i
#done
#
#IFS=$IFS_OLD
#
#echo ${N[@]}
#for s in ${N[*]}
#do
#  CURRN=${N[s]}
#  echo $CURRN
#done

while read line
do
  IFS_OLD=$IFS
  IFS=","
  for i in $NUMBERS
  do
    [[ ${i} =~ "-" ]] && echo -n ${line:${i%%-*}-1:${i##*-}} || echo -n ${line:${i}-1:1}
  done
  IFS=$IFS_OLD
  echo
done



