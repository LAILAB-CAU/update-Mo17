#!/usr/bin/perl
use strict;
use warnings;

my ($paf,$outPrefix,$targetRegion) = @ARGV;

my ($targetChr,$targetStart,$targetEnd) = split /\+/,$targetRegion;

open PAF, "$paf" or die;
open OUT, ">>$outPrefix" or die;
while(my $line = <PAF>){
    chomp $line;
	next if $line =~ /^#/;
    my ($queryName ,        # 拆分每一列
        $queryLength,
        $queryAlignedStart ,
        $queryAlignedEnd   ,
        $coverage    ,
        $identity    ,
        $ref ,
        $refStart   ,
        $refEnd,
        $flag,
        $mappingQuality) = split /\s+/,$line;
	next if($queryLength < 150000);  # 只展示200Kb以上的reads
	next if($refEnd-$refStart < 30000);  # 只展示200Kb以上的reads
	if($ref eq $targetChr and $refStart <= $targetEnd and $refEnd >= $targetStart){
		print OUT "$queryName\t$queryLength\n";
	}
}
close PAF;
close OUT;