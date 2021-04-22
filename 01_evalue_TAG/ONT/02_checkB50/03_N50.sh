#!/bin/bash
for x in /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/*.fa.pass.len
do
cat ${x} >> ont_pass_read.len
done

for x in /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/failedReads/ultralong/*.fail.fa.len
do
cat ${x} >> ont_fail_read.len
done

cat ont_pass_read.len ont_fail_read.len | sort -k 2,2nr - > ont_all_read.len
awk 'BEGIN{SUM=0}{SUM+=$2}END{print SUM}' ont_all_read.len
wc -l ont_all_read.len
