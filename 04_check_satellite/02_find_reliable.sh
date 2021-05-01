#!/bin/bash
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr1.tsv  > all_satellite.final_decomposition.chr1.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr2.tsv  > all_satellite.final_decomposition.chr2.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr3.tsv  > all_satellite.final_decomposition.chr3.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr4.tsv  > all_satellite.final_decomposition.chr4.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr5.tsv  > all_satellite.final_decomposition.chr5.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr6.tsv  > all_satellite.final_decomposition.chr6.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr7.tsv  > all_satellite.final_decomposition.chr7.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr8.tsv  > all_satellite.final_decomposition.chr8.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr9.tsv  > all_satellite.final_decomposition.chr9.reliable.tsv 
awk '{if($NF == "+")print $0}' all_satellite.final_decomposition.chr10.tsv > all_satellite.final_decomposition.chr10.reliable.tsv
