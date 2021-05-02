#!/bin/bash

perl make_1kb_depth_line.pl /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa.len Mo17.final.polish.fa.filtered.depth.bed Mo17.final.polish.fa.filtered.1k.depth.bed 1000 &
perl make_1kb_depth_line.pl /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa.len Mo17.final.polish.fa.original.depth.bed Mo17.final.polish.fa.original.1k.depth.bed 1000 &

perl make_1kb_depth_line.pl /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa.len Mo17.final.polish.fa.filtered.depth.bed Mo17.final.polish.fa.filtered.10k.depth.bed 10000 &
perl make_1kb_depth_line.pl /public1/home/sc30797/wangzijian/update_Mo17/02_fill_gap/08_final_fill/Mo17.final.polish.fa.len Mo17.final.polish.fa.original.depth.bed Mo17.final.polish.fa.original.10k.depth.bed 10000 &

wait