#!/bin/bash

source activate wzjMap

# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr10 | seqkit seq - -u > chr10.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr9  | seqkit seq - -u > chr9.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr8  | seqkit seq - -u > chr8.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr7  | seqkit seq - -u > chr7.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr6  | seqkit seq - -u > chr6.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr5  | seqkit seq - -u > chr5.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr4  | seqkit seq - -u > chr4.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr3  | seqkit seq - -u > chr3.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr2  | seqkit seq - -u > chr2.fa &
# samtools faidx /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa chr1  | seqkit seq - -u > chr1.fa &
seqkit seq /public1/home/sc30797/bxin/LIKE/Mo17/stringdecomposer/test_data/all_satellite.fa -u > all_satellite.fa &
wait
