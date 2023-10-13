#!/bin/bash


for dir in ../haskell/*/; do
  dir=${dir%/}

  new_dir_name="${dir#*-}"
  mv "$dir" "$new_dir_name"
  echo "only left numbers: $dir -> $new_dir_name"
done
