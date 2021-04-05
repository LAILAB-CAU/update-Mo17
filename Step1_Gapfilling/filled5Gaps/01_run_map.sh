#!/bin/bash
set -u
set -e

minimap2 -t 64 -r 10000 -cx asm5 -f 0.02 /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/nanopore_2nd_polish/release_1/02_anchor_and_orient/Mo17.polish.clean_2_correct_orient.fasta /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/assembly_result/Mo17.p_ctg.fa > hifiasm_asm_to_ont_ref.paf