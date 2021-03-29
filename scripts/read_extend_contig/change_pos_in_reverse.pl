#!/usr/bin/perl
use strict;
use warnings;

my($paf,$output) = @ARGV;
open PAF, "$paf" or die;
open OUT, ">$output" or die;
while(<PAF>){
	chomp;
	my @array = split /\s+/;
	if($array[4] eq '-'){
        my $start = $array[3];
        my $end = $array[2];
        $array[2] = $start;
        $array[3] = $end;
    }
    print OUT join("\t",@array),"\n";
}
close PAF;
close OUT;