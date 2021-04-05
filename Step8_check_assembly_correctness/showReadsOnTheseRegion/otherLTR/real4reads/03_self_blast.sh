#!/bin/bash
set -e
set -u
blastn -db ccedfaa7_2k    -query ccedfaa7.2000bin.fa -max_hsps 1 -outfmt 7 -out ccedfaa7_2k.out
blastn -db ccedfaa7_1k    -query ccedfaa7.1000bin.fa -max_hsps 1 -outfmt 7 -out ccedfaa7_1k.out
blastn -db ccedfaa7_500bp -query ccedfaa7.500bin.fa  -max_hsps 1 -outfmt 7 -out ccedfaa7_500bp.out
blastn -db ccedfaa7_200bp -query ccedfaa7.200bin.fa  -max_hsps 1 -outfmt 7 -out ccedfaa7_200bp.out

blastn -db 2ed31109_2k    -query 2ed31109.2000bin.fa -max_hsps 1 -outfmt 7 -out 2ed31109_2k.out
blastn -db 2ed31109_1k    -query 2ed31109.1000bin.fa -max_hsps 1 -outfmt 7 -out 2ed31109_1k.out
blastn -db 2ed31109_500bp -query 2ed31109.500bin.fa  -max_hsps 1 -outfmt 7 -out 2ed31109_500bp.out
blastn -db 2ed31109_200bp -query 2ed31109.200bin.fa  -max_hsps 1 -outfmt 7 -out 2ed31109_200bp.out

blastn -db 491c3912_2k    -query 491c3912.2000bin.fa -max_hsps 1 -outfmt 7 -out 491c3912_2k.out
blastn -db 491c3912_1k    -query 491c3912.1000bin.fa -max_hsps 1 -outfmt 7 -out 491c3912_1k.out
blastn -db 491c3912_500bp -query 491c3912.500bin.fa  -max_hsps 1 -outfmt 7 -out 491c3912_500bp.out
blastn -db 491c3912_200bp -query 491c3912.200bin.fa  -max_hsps 1 -outfmt 7 -out 491c3912_200bp.out

blastn -db 41bca623_2k    -query 41bca623.2000bin.fa -max_hsps 1 -outfmt 7 -out 41bca623_2k.out
blastn -db 41bca623_1k    -query 41bca623.1000bin.fa -max_hsps 1 -outfmt 7 -out 41bca623_1k.out
blastn -db 41bca623_500bp -query 41bca623.500bin.fa  -max_hsps 1 -outfmt 7 -out 41bca623_500bp.out
blastn -db 41bca623_200bp -query 41bca623.200bin.fa  -max_hsps 1 -outfmt 7 -out 41bca623_200bp.out