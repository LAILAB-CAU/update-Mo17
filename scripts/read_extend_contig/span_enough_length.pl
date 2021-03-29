#!/usr/bin/perl
use strict;
use warnings;

my($paf,$out) = @ARGV;



open PAF, "$paf" or die;
open OUT, ">$out" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    if($array[8]-$array[7]>=20000){
        print OUT "$array[0]\n";
    }
}
close PAF;
close OUT;
system("sort $out | uniq - > $out.uniq");
system("grep -f $out.uniq $paf > $paf.valid");
system("rm $out $out.uniq");
