#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` regexp file"
}

while getopts :ho arg
do
  case $arg in
    h)  usage ; exit 0 ;;
    o)  USETYPE=ONLY ;;
  esac
done

shift $(( $OPTIND -1 ))

(( ${USETYPE:=FULL} ))

if [[ $USETYPE = FULL ]]
then
  while read line
  do
    if [[  $line =~ $1 ]]
    then
      echo $line
    fi
  done < $2
elif [[ $USETYPE = ONLY ]]
then
  while read line
  do
    if [[  $line =~ $1 ]]
    then
      echo $BASH_REMATCH
    fi
  done < $2
fi
