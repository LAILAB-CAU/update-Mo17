#!/usr/bin/perl
use strict;
use warnings;

my($paf,$prefix,$left,$right,$length) = @ARGV;



open PAF, "$paf" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    if($array[8]<=$length && $array[5] eq $right){
        open OUT, ">>$prefix/$right.start.paf" or die;
        print OUT "$_\n";
        close OUT;
    }
    elsif($array[7]>=$array[6]-$length && $array[5] eq $left){
        open OUT, ">>$prefix/$left.end.paf" or die;
        print OUT "$_\n";
        close OUT;
    }
}
close PAF;
