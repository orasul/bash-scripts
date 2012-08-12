#!/usr/bin/env bash

usage ()
{
  echo "Usage: `basename $0` file"
}

if [ ${#} -le 0 ]
then
  usage
  exit 1
fi

while read line
do 
  echo $line
done <$1
