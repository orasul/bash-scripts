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

exec 9<$1

while read -u 9 line
do 
  echo $line
done

exec 9<&-
