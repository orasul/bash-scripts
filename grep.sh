#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` regexp file"
}

if [ ${#} -le 1 ]
then
  usage
  exit 1
fi

while read line
do
  if [[  $line =~ $1 ]]
  then
    echo $line
  fi
done <$2
