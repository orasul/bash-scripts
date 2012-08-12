#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` file"
}

while getopts :hn arg
do
  case $arg in
    h)  usage ; exit 0 ;;
    n)  USETYPE=NUMBER ;;
  esac
done

(( ${USETYPE:=PLAIN} ))

if [[ $USETYPE = PLAIN ]]
then
  while read line
  do 
    printf '%s\n' "$line"
  done
elif [[ $USETYPE = NUMBER ]]
then
  i=0
  while read line
  do 
    printf '%6d  %s\n' "$(( ++i ))" "$line"
  done
fi

