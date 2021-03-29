#!/usr/bin/perl
use strict;
use warnings;

my($infor,$out) = @ARGV;



open PAF, "$infor" or die;
open OUT, ">$out" or die;
my %hash_reads;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    $hash_reads{$array[0]} += $array[4];
}
close PAF;

while(my ($key,$value) = each %hash_reads){
    if($value >= 0.85){
        print OUT "$key\n";
    }
}
close OUT;
