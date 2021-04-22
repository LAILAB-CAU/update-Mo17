#!/bin/bash
source activate wzjMap


seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200329-UNL085-P1-PAE78052.fa | awk '{print $1}' - > 20200329-UNL085-P1-PAE78052.list &
seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200328-UNL085-P1-PAE78052.fa | awk '{print $1}' - > 20200328-UNL085-P1-PAE78052.list &
seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200118-UNL085-P5-PAE39466.fa | awk '{print $1}' - > 20200118-UNL085-P5-PAE39466.list &
seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20200117-UNL085-P5-PAE39466.fa | awk '{print $1}' - > 20200117-UNL085-P5-PAE39466.list &
seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191231-UNL085-P1-PAE32963.fa | awk '{print $1}' - > 20191231-UNL085-P1-PAE32963.list &
seqkit fx2tab -nl /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/20191230-UNL085-P1-PAE32963.fa | awk '{print $1}' - > 20191230-UNL085-P1-PAE32963.list &
wait
seqkit grep -v -f 20200329-UNL085-P1-PAE78052.list 20200329-UNL085-P1-PAE78052.fa > 20200329-UNL085-P1-PAE78052.fail.fa &
seqkit grep -v -f 20200328-UNL085-P1-PAE78052.list 20200328-UNL085-P1-PAE78052.fa > 20200328-UNL085-P1-PAE78052.fail.fa &
seqkit grep -v -f 20200118-UNL085-P5-PAE39466.list 20200118-UNL085-P5-PAE39466.fa > 20200118-UNL085-P5-PAE39466.fail.fa &
seqkit grep -v -f 20200117-UNL085-P5-PAE39466.list 20200117-UNL085-P5-PAE39466.fa > 20200117-UNL085-P5-PAE39466.fail.fa &
seqkit grep -v -f 20191231-UNL085-P1-PAE32963.list 20191231-UNL085-P1-PAE32963.fa > 20191231-UNL085-P1-PAE32963.fail.fa &
seqkit grep -v -f 20191230-UNL085-P1-PAE32963.list 20191230-UNL085-P1-PAE32963.fa > 20191230-UNL085-P1-PAE32963.fail.fa &
wait

for x in /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/*.fa
do
seqkit fx2tab -nl ${x} | awk '{print $1"\t"$NF}' - > ${x}.pass.len
done

for x in /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/failedReads/ultralong/*.fail.fa
do
seqkit fx2tab -nl ${x} | awk '{print $1"\t"$NF}' - > ${x}.len
done