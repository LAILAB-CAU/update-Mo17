#!/usr/bin/perl
use strict;
use warnings;

my ($paf,$outPrefix,$targetRegion,$filter) = @ARGV;

my ($targetChr,$targetStart,$targetEnd) = split /\+/,$targetRegion;

open PAF, "$paf" or die;
# open OUT, ">>$outPrefix" or die;
while(my $line = <PAF>){
    chomp $line;
	next if $line =~ /^#/;
    my ($query ,        # 拆分每一列
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
	next if($refEnd-$refStart < $filter);  # 只展示200Kb以上的reads
	if($ref eq $targetChr and $refStart <= $targetEnd and $refEnd >= $targetStart){
		
		# print OUT "$queryName\t$queryLength\n";

		open BED, ">>$outPrefix.bed" or die;
		print BED "$query\t1\t$queryLength\n";
		close BED;

		open KAR, ">>$outPrefix.kar" or die;
		my ($realRefTS,$realRefTE);
		my $refName = (split /:/,$targetChr)[0];
		if($targetChr =~ /_/){
			($realRefTS,$realRefTE) = ((split /-/,(split/:/,$targetChr)[1])[0] + $targetStart,(split /-/,(split/:/,$targetChr)[1])[0] + $targetEnd);
		}
		else{
			($realRefTS,$realRefTE) = ($targetStart, $targetEnd);
		}
		print KAR "$refName\t$realRefTS\t$realRefTE\t$query\t1\t$queryLength\n";
		close KAR;


		open COOR, ">>$outPrefix.coor" or die;
		my ($realRefS,$realRefE);
		if($targetChr =~ /_/){
			($realRefS,$realRefE) = ((split /-/,(split/:/,$targetChr)[1])[0] + $refStart,(split /-/,(split/:/,$targetChr)[1])[0] + $refEnd);
		}
		else{
			($realRefS,$realRefE) = ($refStart,$refEnd);
		}
		
		if($flag eq '0' or $flag eq '2048'){
			print COOR "$refName\t$query\t$realRefS\t$realRefE\t$queryAlignedStart\t$queryAlignedEnd\n";
		}
		else{
			print COOR "$refName\t$query\t$realRefS\t$realRefE\t$queryAlignedEnd\t$queryAlignedStart\n";
		}
		close COOR;
	}
}
close PAF;
close OUT;