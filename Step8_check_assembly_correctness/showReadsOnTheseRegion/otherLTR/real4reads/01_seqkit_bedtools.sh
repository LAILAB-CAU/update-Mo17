#!/bin/bash
set -e
set -u
# seqkit grep -f list ../candidate.fa > 4reads.fa
# seqkit split2 -p 4 4reads.fa -O 4reads
# for x in 4reads.part_00*.fa;do seqkit fx2tab -nl ${x} | awk '{print $1"\t"$NF}' - > ${x}.len;done
# for x in 4reads.part_00*.fa.len;do bedtools makewindows -w 200 -g ${x} > ${x}.bed;done
# for x in 4reads.part_00*.fa ;do bedtools getfasta -fi ${x} -bed ${x}.len.bed -fo ${x}.bin.fa;done
# bedtools makewindows -w 200 -b pacbio.bed > pacbio.200bin.bed 
# bedtools getfasta -fi ../4reads.fa -bed pacbio.200bin.bed -fo pacbio.200bin.fa

# bedtools makewindows -w 500 -b pacbio.bed > pacbio.500bin.bed
# bedtools getfasta -fi ../../../contigs.fa -bed pacbio.500bin.bed -fo pacbio.500bin.fa

# bedtools makewindows -w 1000 -b pacbio.bed > pacbio.1000bin.bed
# bedtools getfasta -fi ../../../contigs.fa -bed pacbio.1000bin.bed -fo pacbio.1000bin.fa


# bedtools makewindows -w 2000 -b pacbio.bed > pacbio.2000bin.bed
# bedtools getfasta -fi ../../../contigs.fa -bed pacbio.2000bin.bed -fo pacbio.2000bin.fa


bedtools makewindows -w 200 -b ccedfaa7.bed > ccedfaa7.200bin.bed 
bedtools getfasta -fi 4reads.fa -bed ccedfaa7.200bin.bed -fo ccedfaa7.200bin.fa

bedtools makewindows -w 500 -b ccedfaa7.bed > ccedfaa7.500bin.bed
bedtools getfasta -fi 4reads.fa -bed ccedfaa7.500bin.bed -fo ccedfaa7.500bin.fa

bedtools makewindows -w 1000 -b ccedfaa7.bed > ccedfaa7.1000bin.bed
bedtools getfasta -fi 4reads.fa -bed ccedfaa7.1000bin.bed -fo ccedfaa7.1000bin.fa

bedtools makewindows -w 2000 -b ccedfaa7.bed > ccedfaa7.2000bin.bed
bedtools getfasta -fi 4reads.fa -bed ccedfaa7.2000bin.bed -fo ccedfaa7.2000bin.fa



bedtools makewindows -w 200 -b 2ed31109.bed > 2ed31109.200bin.bed 
bedtools getfasta -fi 4reads.fa -bed 2ed31109.200bin.bed -fo 2ed31109.200bin.fa

bedtools makewindows -w 500 -b 2ed31109.bed > 2ed31109.500bin.bed
bedtools getfasta -fi 4reads.fa -bed 2ed31109.500bin.bed -fo 2ed31109.500bin.fa

bedtools makewindows -w 1000 -b 2ed31109.bed > 2ed31109.1000bin.bed
bedtools getfasta -fi 4reads.fa -bed 2ed31109.1000bin.bed -fo 2ed31109.1000bin.fa

bedtools makewindows -w 2000 -b 2ed31109.bed > 2ed31109.2000bin.bed
bedtools getfasta -fi 4reads.fa -bed 2ed31109.2000bin.bed -fo 2ed31109.2000bin.fa



bedtools makewindows -w 200 -b 491c3912.bed > 491c3912.200bin.bed 
bedtools getfasta -fi 4reads.fa -bed 491c3912.200bin.bed -fo 491c3912.200bin.fa

bedtools makewindows -w 500 -b 491c3912.bed > 491c3912.500bin.bed
bedtools getfasta -fi 4reads.fa -bed 491c3912.500bin.bed -fo 491c3912.500bin.fa

bedtools makewindows -w 1000 -b 491c3912.bed > 491c3912.1000bin.bed
bedtools getfasta -fi 4reads.fa -bed 491c3912.1000bin.bed -fo 491c3912.1000bin.fa

bedtools makewindows -w 2000 -b 491c3912.bed > 491c3912.2000bin.bed
bedtools getfasta -fi 4reads.fa -bed 491c3912.2000bin.bed -fo 491c3912.2000bin.fa



bedtools makewindows -w 200 -b 41bca623.bed > 41bca623.200bin.bed 
bedtools getfasta -fi 4reads.fa -bed 41bca623.200bin.bed -fo 41bca623.200bin.fa

bedtools makewindows -w 500 -b 41bca623.bed > 41bca623.500bin.bed
bedtools getfasta -fi 4reads.fa -bed 41bca623.500bin.bed -fo 41bca623.500bin.fa

bedtools makewindows -w 1000 -b 41bca623.bed > 41bca623.1000bin.bed
bedtools getfasta -fi 4reads.fa -bed 41bca623.1000bin.bed -fo 41bca623.1000bin.fa

bedtools makewindows -w 2000 -b 41bca623.bed > 41bca623.2000bin.bed
bedtools getfasta -fi 4reads.fa -bed 41bca623.2000bin.bed -fo 41bca623.2000bin.fa