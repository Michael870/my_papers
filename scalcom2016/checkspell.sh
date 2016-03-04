#!/bin/bash


tex_files=`find ./ -type f -name "*.tex"`
for tex_file in $tex_files
do
    aspell -c $tex_file
done
