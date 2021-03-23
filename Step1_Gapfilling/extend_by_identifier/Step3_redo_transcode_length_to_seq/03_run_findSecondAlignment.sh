#!/bin/bash
set -e
set -u

perl findSecondAlignment.pl blastR50.out   blastR50WithoutM_SecondAlignment.out   &
perl findSecondAlignment.pl blastR100.out  blastR100WithoutM_SecondAlignment.out  &
perl findSecondAlignment.pl blastR200.out  blastR200WithoutM_SecondAlignment.out  &
wait

awk '{if($6 >1000)print $0}' blastR50WithoutM_SecondAlignment.out  > valid_50.txt
awk '{if($6 >500)print $0}'  blastR100WithoutM_SecondAlignment.out > valid_100.txt
awk '{if($6 >250)print $0}'  blastR200WithoutM_SecondAlignment.out > valid_200.txt




perl corr_loc.pl rDNAseq.len rDNAseq.indel.bed  50 corr_bed_50.bed
perl corr_loc.pl rDNAseq.len rDNAseq.indel.bed 100 corr_bed_100.bed
perl corr_loc.pl rDNAseq.len rDNAseq.indel.bed 200 corr_bed_200.bed


perl antiTansLoc.pl valid_50.txt  corr_bed_50.bed  coor_real_50.txt
perl antiTansLoc.pl valid_100.txt corr_bed_100.bed coor_real_100.txt
perl antiTansLoc.pl valid_200.txt corr_bed_200.bed coor_real_200.txt



