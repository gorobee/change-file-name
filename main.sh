#!/bin/bash

###################### Declaration
beforeFiles=()
afterFiles=()
target_dir="./files/*"

###################### Pick up the csv-files in the target directory.
for filepath in ${target_dir}; do
  if [ -f ${filepath} ] ; then
    # pickup csv.
    if [ `echo $filepath | grep 'csv'` ] ; then
      # remove the directory.
      filepath="${filepath##*/}"
      beforeFiles+=("${filepath}")
    fi
  fi
done

echo "The number of files is ${#beforeFiles[*]}"

###################### converting the file name into new name.
for name_i in ${beforeFiles[@]}; do
  let file_num++
  echo "./files/${name_i} -> ./files/${file_num}.csv"
  mv -i "./files/${name_i}" "./files/${file_num}.csv"
done

