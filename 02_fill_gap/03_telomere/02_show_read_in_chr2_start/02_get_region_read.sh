#!/bin/bash
set -u 
set -e 

bedtools intersect -a 20191219-UNL085-P5-PAE34153.bed -b region.bed.sorted -wa -wb > 20191219-UNL085-P5-PAE34153.region.bed &
bedtools intersect -a 20191230-UNL085-P1-PAE32963.bed -b region.bed.sorted -wa -wb > 20191230-UNL085-P1-PAE32963.region.bed &
bedtools intersect -a 20191231-UNL085-P1-PAE32963.bed -b region.bed.sorted -wa -wb > 20191231-UNL085-P1-PAE32963.region.bed &
bedtools intersect -a 20200117-UNL085-P5-PAE39466.bed -b region.bed.sorted -wa -wb > 20200117-UNL085-P5-PAE39466.region.bed &
bedtools intersect -a 20200118-UNL085-P5-PAE39466.bed -b region.bed.sorted -wa -wb > 20200118-UNL085-P5-PAE39466.region.bed &
bedtools intersect -a 20200312-UNL085-P1-PAE30600.bed -b region.bed.sorted -wa -wb > 20200312-UNL085-P1-PAE30600.region.bed &
bedtools intersect -a 20200313-UNL085-P1-PAE30600.bed -b region.bed.sorted -wa -wb > 20200313-UNL085-P1-PAE30600.region.bed &
bedtools intersect -a 20200328-UNL085-P1-PAE78052.bed -b region.bed.sorted -wa -wb > 20200328-UNL085-P1-PAE78052.region.bed &
bedtools intersect -a 20200329-UNL085-P1-PAE78052.bed -b region.bed.sorted -wa -wb > 20200329-UNL085-P1-PAE78052.region.bed &
bedtools intersect -a 20200330-UNL085-P1-PAE72324.bed -b region.bed.sorted -wa -wb > 20200330-UNL085-P1-PAE72324.region.bed &
bedtools intersect -a 20200330-UNL085-P1-PAE73001.bed -b region.bed.sorted -wa -wb > 20200330-UNL085-P1-PAE73001.region.bed &
bedtools intersect -a 20200330-UNL085-P1-PAE74959.bed -b region.bed.sorted -wa -wb > 20200330-UNL085-P1-PAE74959.region.bed &
bedtools intersect -a 20200331-UNL085-P1-PAE73476.bed -b region.bed.sorted -wa -wb > 20200331-UNL085-P1-PAE73476.region.bed &
bedtools intersect -a 20200331-UNL085-P1-PAE76301.bed -b region.bed.sorted -wa -wb > 20200331-UNL085-P1-PAE76301.region.bed &
bedtools intersect -a 20200331-UNL085-P1-PAE76304.bed -b region.bed.sorted -wa -wb > 20200331-UNL085-P1-PAE76304.region.bed &
bedtools intersect -a 20200331-UNL085-P1-PAE77443.bed -b region.bed.sorted -wa -wb > 20200331-UNL085-P1-PAE77443.region.bed &
bedtools intersect -a 20200402-UNL085-P1-PAE66442.bed -b region.bed.sorted -wa -wb > 20200402-UNL085-P1-PAE66442.region.bed &
bedtools intersect -a 20200403-UNL085-P1-PAE59748.bed -b region.bed.sorted -wa -wb > 20200403-UNL085-P1-PAE59748.region.bed &
bedtools intersect -a 20200403-UNL085-P1-PAE63133.bed -b region.bed.sorted -wa -wb > 20200403-UNL085-P1-PAE63133.region.bed &
bedtools intersect -a 20200403-UNL085-P1-PAE65508.bed -b region.bed.sorted -wa -wb > 20200403-UNL085-P1-PAE65508.region.bed &
bedtools intersect -a 20200404-UNL085-P1-PAE58899.bed -b region.bed.sorted -wa -wb > 20200404-UNL085-P1-PAE58899.region.bed &
bedtools intersect -a 20200404-UNL085-P1-PAE59636.bed -b region.bed.sorted -wa -wb > 20200404-UNL085-P1-PAE59636.region.bed &
bedtools intersect -a 20200404-UNL085-P1-PAE62586.bed -b region.bed.sorted -wa -wb > 20200404-UNL085-P1-PAE62586.region.bed &
bedtools intersect -a 20200404-UNL085-P1-PAE63133.bed -b region.bed.sorted -wa -wb > 20200404-UNL085-P1-PAE63133.region.bed &
bedtools intersect -a 20200404-UNL085-P1-PAE64841.bed -b region.bed.sorted -wa -wb > 20200404-UNL085-P1-PAE64841.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE55943.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE55943.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE58455.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE58455.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE59610.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE59610.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE64851.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE64851.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE69208.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE69208.region.bed &
bedtools intersect -a 20200405-UNL085-P1-PAE69448.bed -b region.bed.sorted -wa -wb > 20200405-UNL085-P1-PAE69448.region.bed &
bedtools intersect -a 20200406-UNL085-P1-PAE69448.bed -b region.bed.sorted -wa -wb > 20200406-UNL085-P1-PAE69448.region.bed &
bedtools intersect -a 20200406-UNL085-P5-PAE70217.bed -b region.bed.sorted -wa -wb > 20200406-UNL085-P5-PAE70217.region.bed &
bedtools intersect -a 20200407-UNL085-P5-PAE66590.bed -b region.bed.sorted -wa -wb > 20200407-UNL085-P5-PAE66590.region.bed &
bedtools intersect -a 20200408-UNL085-P5-PAE69418.bed -b region.bed.sorted -wa -wb > 20200408-UNL085-P5-PAE69418.region.bed &
bedtools intersect -a 20200409-UNL085-P5-PAE46763.bed -b region.bed.sorted -wa -wb > 20200409-UNL085-P5-PAE46763.region.bed &

wait
