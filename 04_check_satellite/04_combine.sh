#!/bin/bash

# perl generate_monomer.pl all_satellite.final_decomposition.chr1.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr2.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr3.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr4.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr5.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr6.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr7.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr8.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr9.reliable.tsv  
# perl generate_monomer.pl all_satellite.final_decomposition.chr10.reliable.tsv 


bedtools merge -d 1 -i tRNASAT-1_ZM.bed > tRNASAT-1_ZM.merged.bed
bedtools merge -d 1 -i TR-1.bed > TR-1.merged.bed
bedtools merge -d 1 -i knob180.bed  > knob180.merged.bed
bedtools merge -d 1 -i CentC.bed > CentC.merged.bed
bedtools merge -d 1 -i CENSATC4_ZM.bed > CENSATC4_ZM.merged.bed
bedtools merge -d 1 -i CENSAT_ZM.bed > CENSAT_ZM.merged.bed
