#!/bin/bash

# Created date: 2020/04/19
# Updated date: 2021/05/04
# This code changes the file-name in the current directory from XXX.csv to i.csv. (i=1,2,3,...)


###################### Declaration
beforeFiles=()
afterFiles=()
target_dir="./*"

###################### Pick up the csv-files in the target directory.
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

