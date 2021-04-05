#!/bin/bash
set -e
set -u

for x in ptg0*l/ref.bed
do
bedtools makewindows -b ${x} -w 1000000 > ${x}.1MB.bed
sed -i 's/\s+/:/g' ${x}.1MB.bed
done

for x in ptg0*l/query.bed
do
bedtools makewindows -b ${x} -w 1000000 > ${x}.1MB.bed
sed -i 's/\s+/:/g' ${x}.1MB.bed
done