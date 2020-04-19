#!/bin/bash

# name of csv-file converter.

###################### declaration
beforeFiles=()
afterFiles=()
target_dir="./*"

###################### pick up the csv-files in the target directory.
for filepath in ${target_dir}; do
  if [ -f ${filepath} ] ; then
    # pickup csv.
    if [ `echo $filepath | grep 'csv'` ] ; then
      # remove the directory.
      filepath="${filepath##*/}"
      beforeFiles+=("${filepath}")
      echo ${filepath}
    fi
  fi
done

echo "The number of files is ${#beforeFiles[*]}"

###################### converting the file name into new name.
for name_i in ${beforeFiles[@]}; do
  let file_num++
  echo "${name_i} -> ${file_num}"
  mv -i $name_i "${file_num}.csv"
done

