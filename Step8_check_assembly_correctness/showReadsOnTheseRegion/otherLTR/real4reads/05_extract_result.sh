#!/bin/bash
set -u
set -e
for x in *.out 
do
prefix=${x%.*}
awk '{if($1!="#" && $1!=$2){print $1"\t"$2"\t"$3}}' ${x} > ${prefix}.corr
done
