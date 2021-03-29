#!/usr/bin/perl
use strict;
use warnings;

my($paf,$output) = @ARGV;

my %hash_read_cov;
open PAF, "$paf" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    open TEMP, ">>$array[0].temp.bed" or die;
    print TEMP "$array[5]\t$array[7]\t$array[8]\n";
    close TEMP;
}
close PAF;

my %hash_length;

my @tempfiles = <./*.temp.bed>;
foreach my $file(@tempfiles){
    my @lllll = split /\//,$file;
    my @llllll = split /\./,$lllll[-1];
    my $read = $llllll[0];
    system("sort -k 1,1 -k 2,2n -k 3,3n $file >$file.sorted");
    system("bedtools merge -i $file.sorted > $file.sorted.merged");
    system("rm  $file $file.sorted");
    open NEW, "$file.sorted.merged" or die;
    while(my $line = <NEW>){
        chomp $line;
        my @array_bed = split /\s+/,$line;
	my $span_len = $array_bed[2] - $array_bed[1];
        $hash_length{$read} += $span_len;
    }
    close NEW;
    system("rm  $file.sorted.merged");
}


open PAF, "$paf" or die;
open OUT, ">$output" or die;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    if($hash_length{$array[0]} > 40000){
        print OUT "$_\n";
    }
}
close PAF;
close OUT;
