#!/usr/bin/perl
use strict;
use warnings;

my($paf,$highlight,$kname) = @ARGV;

open PAF, "$paf" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    open TEMP, ">show_reads_$kname.k" or die;
    print TEMP "$array[5]:1:$array[6]\n";
    print TEMP "$array[0]:1:$array[1]";
    close TEMP;
    system("~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 $paf  -k show_reads_$kname.k  --highlight $highlight --chro_axis --no_scale --show_pos_with_label -o show_reads/$array[5]_$array[0]");
    system("singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file show_reads/$array[5]_$array[0].svg --export-pdf show_reads/$array[5]_$array[0].pdf");
}
close PAF;
