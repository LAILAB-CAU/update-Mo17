#!/bin/bash
set -u 
set -e 

bedtools intersect -a batch1_1.bed -b region.bed.sorted -wa -wb > batch1_1.region.bed &
bedtools intersect -a batch2_1.bed -b region.bed.sorted -wa -wb > batch2_1.region.bed &
bedtools intersect -a batch2_2.bed -b region.bed.sorted -wa -wb > batch2_2.region.bed &
bedtools intersect -a batch3_1.bed -b region.bed.sorted -wa -wb > batch3_1.region.bed &
bedtools intersect -a batch3_2.bed -b region.bed.sorted -wa -wb > batch3_2.region.bed &
bedtools intersect -a batch3_3.bed -b region.bed.sorted -wa -wb > batch3_3.region.bed &
bedtools intersect -a batch3_4.bed -b region.bed.sorted -wa -wb > batch3_4.region.bed &
wait
