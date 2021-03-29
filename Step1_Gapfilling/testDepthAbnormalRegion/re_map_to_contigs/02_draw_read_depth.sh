#!/bin/bash
set -u
set -e

bedtools makewindows -w 1000000 -g contigs.fa.len > contigs.fa.1MB.bed

perl drawContigDepth.pl contigs.fa.1MB.bed /public1/home/sc30797/wangzijian/update_Mo17/Step1_Gap_filling/testDepthAbnormalRegion/contigs/contigs.fa.rm.hl contigs.fa.depth.bed

