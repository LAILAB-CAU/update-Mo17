#!/bin/bash

# head -n 2 ../fill_5SrRNA.fa > the_5SrRNA.fa
blastn -num_threads 64  -db nanopore_pass_read -query the_5SrRNA.fa -max_target_seqs 100000000 -max_hsps 5000  -outfmt 7 -out 5SrRNA.blast.ont.txt
