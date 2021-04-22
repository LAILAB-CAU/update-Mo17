#!/bin/bash

source activate wzjMap

minimap2 -t64 -cx map-ont /public1/home/sc30797/wangzijian/update_Mo17/00_assembly/ONT_original/Mo17_ont_origin_asm.fa material.fa > rDNA.paf