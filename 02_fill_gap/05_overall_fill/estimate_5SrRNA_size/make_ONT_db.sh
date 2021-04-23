#!/bin/bash

cat /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/*fa > /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/nanopore_pass_read.fa
makeblastdb -in /public1/home/sc30797/wangzijian/update_Mo17/nanopore_reads/nanopore_raw_read/nanopore_pass_read.fa -dbtype nucl -title nanopore_pass_read -parse_seqids -out nanopore_pass_read
