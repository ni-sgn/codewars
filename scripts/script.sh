#!/usr/bin/env sh

for dir in */; do
  dir=${dir%/}
  if [ -d "$dir/haskell" ]; then
    echo "moving files from $dir/haskell to $dir"
    mv "$dir/haskell"/* "$dir"
    rmdir "$dir/haskell"
  fi
  
done
