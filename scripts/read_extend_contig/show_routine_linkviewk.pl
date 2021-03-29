#!/usr/bin/perl
use strict;
use warnings;

my($paf,$left,$right) = @ARGV;

my %hash_read_cov;
open PAF, "$paf" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    open TEMP, ">show_reads.k" or die;
    if($array[5] eq $left){
        my $start = $array[6]-1000000;
        print TEMP "$array[5]:$start:$array[6]\n";
        print TEMP "$array[0]:1:$array[1]";
    }
    else{
        print TEMP "$array[5]:1:1500000\n";
        print TEMP "$array[0]:1:$array[1]";
    }
    
    close TEMP;
    system("~/wangzijian/software/LINKVIEW-master/LINKVIEW.py -t3 $paf  -k show_reads.k  --highlight contig_read_for_rm/rm_for_draw.hl --chro_axis --no_scale --show_pos_with_label -o show_reads/$array[0]_$array[5]");
}
close PAF;
