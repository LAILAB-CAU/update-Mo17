#!/bin/bash

ontasm=/public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa
samtools faidx ${ontasm} chr1 >> chr1.fa
samtools faidx ${ontasm} chr2 >> chr2.fa
samtools faidx ${ontasm} chr3 >> chr3.fa
samtools faidx ${ontasm} chr4 >> chr4.fa
samtools faidx ${ontasm} chr5 >> chr5.fa
samtools faidx ${ontasm} chr6 >> chr6.fa
samtools faidx ${ontasm} chr7 >> chr7.fa
samtools faidx ${ontasm} chr8 >> chr8.fa
samtools faidx ${ontasm} chr9 >> chr9.fa
samtools faidx ${ontasm} chr10 >> chr10.fa