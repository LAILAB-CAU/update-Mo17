#!/bin/bash

source activate wzjMap
seqkit stat -j 36 -a ./*.over150K.fa > fail_read_150K.stat