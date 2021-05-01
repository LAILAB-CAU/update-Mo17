#!/bin/bash
sed -n '1150,10924p'   all_satellite.final_decomposition.chr8.reliable.tsv > CentC_region
sed -n '11314,123622p' all_satellite.final_decomposition.chr8.reliable.tsv > knob180_region