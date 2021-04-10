#!/bin/bash

bedtools makewindows -g ../Mo17_ont_origin_asm.fa.len -w 1000 > ../Mo17_ont_origin_asm.fa.1k.bed
perl make_1kb_depth_line.pl ../Mo17_ont_origin_asm.fa.1k.bed Mo17_ont_origin_asm.fa.filtered.depth.bed Mo17_ont_origin_asm.fa.filtered.1k.depth.bed
perl make_1kb_depth_line.pl ../Mo17_ont_origin_asm.fa.1k.bed Mo17_ont_origin_asm.fa.original.depth.bed Mo17_ont_origin_asm.fa.original.1k.depth.bed