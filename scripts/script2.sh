#!/bin/bash

exclude=("../haskell" "../scripts")

for dir in ../*/; do
  dir=${dir%/} 

  echo "$exclude"
  if [[ "${exclude[*]}" != *"$dir"* ]];then
    if [ -d ../haskell ] ; then  
      echo "moving $dir to haskell"
      mv "$dir" ../haskell 
    else
      echo "could not find haskell folder"
    fi
    #echo "inside $dir"
  else
    echo "found $dir"
  fi
done


