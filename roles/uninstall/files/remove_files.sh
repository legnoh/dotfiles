#!/bin/bash

echo "#5: uninstall users file"
default_files=('.ansible',
               '.ansible.cfg',
               '.ansible_async',
               '.cache',
               '.CFUserTextEncoding',
               '.DS_Store',
               '.Trash',
               'Applications',
               'Desktop',
               'Documents',
               'Downloads',
               'Library',
               'Movies',
               'Music',
               'Pictures',
               'Public');

for file in *; do
  if `echo ${default_files[@]} | grep -q "$file"` ; then
    echo "  existed: ${file}"
  else
    echo "  removing: ${file}"
    rm -rf ${file}
  fi
done
