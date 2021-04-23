#!/bin/bash

head -n 2 ../fill_5SrRNA.fa > the_5SrRNA.fa
blastn -num_threads 64  -db /public1/home/sc30797/kevin/update_Mo17/busco/find_missing_gene_hifi/hifi_reads -query the_5SrRNA.fa -max_target_seqs 100000000  -outfmt 7 -out 5SrRNA.blast.txt
