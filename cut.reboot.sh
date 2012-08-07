#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` [ -c N-M ] file"
}

while getopts :hc:d:f: arg
do
  case $arg in
    h)  usage ; exit 0 ;;
    c)  NUMBERS=$OPTARG ; TYPE="CHAR" ;;   # characters
    d)  DELIMETR=$OPTARG ;;                # delimetr
    f)  FIELDS=$OPTARG ; TYPE="FIELD" ;;   # fields numbers
  esac
done

DELIMETR=${DELIMETR:=" "}

characters ()
{
  local IFS=","
  for i in $1
  do
    [[ ${i} =~ "-" ]] && echo -n ${line:${i%%-*}-1:${i##*-}} || echo -n ${line:${i}-1:1}
  done
  echo
}

fields ()
{
  local DELIM=$1
  local IFS=","
  for field in $2
  do
    local IFS=$DELIM
    echo -n `eval $line[$field]`
#    for col in $line
#    do
#      echo -n $col
#      echo -en "\t"
#    done
  done
  echo
}

while read line
do
  if [[ $TYPE = "CHAR" ]]
  then
    characters $NUMBERS
  elif [[ $TYPE = "FIELD" ]]
  then
    fields $DELIMETR $FIELDS
  fi
done



