#!/usr/bin/perl
use strict;
use warnings;

my($paf,$output) = @ARGV;

my %hash_read_cov;
open PAF, "$paf" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    open TEMP, ">>temp.bed" or die;
    print TEMP "$array[0]\t$array[2]\t$array[3]\n";
    close TEMP;
}
close PAF;
system("sort -k 1,1 -k 2,2n -k 3,3n temp.bed >temp.bed.sorted");
system("bedtools merge -i temp.bed.sorted > temp.bed.sorted.merged");
system("rm  temp.bed temp.bed.sorted");

open TEMP, "temp.bed.sorted.merged" or die;
while(<TEMP>){
    chomp;
    my @array = split /\s+/;
    $hash_read_cov{$array[0]} += $array[2] - $array[1];
}
close TEMP;
system("rm  temp.bed.sorted.merged");

open PAF, "$paf" or die;
open OUT, ">$output" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    if($hash_read_cov{$array[0]} > 40000){
        print OUT "$_\n";
    }
}
close PAF;
close OUT;
