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

shift $(($OPTIND - 1))

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
  local FIELDS=$2
  local IFS=","
#  length_fields=${#FIELDS[@]}
#  echo $length_fields
#  field_count=0
  for field in $FIELDS
  do
#    field_count=$(( field_count+1 ))
    local IFS=$DELIM
    count=0
    for col in $line
    do
      count=$(( count+1 ))
      [[ $count -eq $field ]] && echo -n $col && echo -n "$DELIM"
#      [[ $count -eq $field ]] && echo -n $col && [[ $field_count -ne $length_fields ]] && echo -n "$DELIM"
    done
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
done <$1



