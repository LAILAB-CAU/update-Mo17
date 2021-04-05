#!/bin/bash
set -e
set -u

makeblastdb -in  ccedfaa7.2000bin.fa -dbtype nucl -out ccedfaa7_2k -parse_seqids
makeblastdb -in  ccedfaa7.1000bin.fa -dbtype nucl -out ccedfaa7_1k -parse_seqids
makeblastdb -in  ccedfaa7.500bin.fa  -dbtype nucl -out ccedfaa7_500bp -parse_seqids
makeblastdb -in  ccedfaa7.200bin.fa  -dbtype nucl -out ccedfaa7_200bp -parse_seqids

makeblastdb -in  2ed31109.2000bin.fa -dbtype nucl -out 2ed31109_2k -parse_seqids
makeblastdb -in  2ed31109.1000bin.fa -dbtype nucl -out 2ed31109_1k -parse_seqids
makeblastdb -in  2ed31109.500bin.fa  -dbtype nucl -out 2ed31109_500bp -parse_seqids
makeblastdb -in  2ed31109.200bin.fa  -dbtype nucl -out 2ed31109_200bp -parse_seqids

makeblastdb -in  491c3912.2000bin.fa -dbtype nucl -out 491c3912_2k -parse_seqids
makeblastdb -in  491c3912.1000bin.fa -dbtype nucl -out 491c3912_1k -parse_seqids
makeblastdb -in  491c3912.500bin.fa  -dbtype nucl -out 491c3912_500bp -parse_seqids
makeblastdb -in  491c3912.200bin.fa  -dbtype nucl -out 491c3912_200bp -parse_seqids

makeblastdb -in  41bca623.2000bin.fa -dbtype nucl -out 41bca623_2k -parse_seqids
makeblastdb -in  41bca623.1000bin.fa -dbtype nucl -out 41bca623_1k -parse_seqids
makeblastdb -in  41bca623.500bin.fa  -dbtype nucl -out 41bca623_500bp -parse_seqids
makeblastdb -in  41bca623.200bin.fa  -dbtype nucl -out 41bca623_200bp -parse_seqids

