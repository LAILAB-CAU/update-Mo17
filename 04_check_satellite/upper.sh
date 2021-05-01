#!/bin/bash

source activate wzjMap

seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr10.fa -u > chr10.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr9.fa  -u > chr9.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr8.fa  -u > chr8.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr7.fa  -u > chr7.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr6.fa  -u > chr6.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr5.fa  -u > chr5.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr4.fa  -u > chr4.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr3.fa  -u > chr3.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr2.fa  -u > chr2.fa &
seqkit seq /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/07_polished_region/chr1.fa  -u > chr1.fa &
seqkit seq /public1/home/sc30797/bxin/LIKE/Mo17/stringdecomposer/test_data/all_satellite.fa     -u > all_satellite.fa &
wait
