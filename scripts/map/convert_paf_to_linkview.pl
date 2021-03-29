#!/usr/bin/perl
use strict;
die usage() if @ARGV == 0;



my($paf) = @ARGV;

open PAF,"$paf" or die;

my %hash_query_length;
my %hash_query_anchor_contig1;
my %hash_query_anchor_contig2;
while(<PAF>){
    chomp;
    my @array = split /\s+/;
    
    unless(exists $hash_query_length{$array[0]}){
        $hash_query_length{$array[0]} = $array[1];
    }

    if($array[5] =~ /ctg/){
        $hash_query_anchor_contig1{$array[0]}{$array[5]} = 1;
    }
    elsif($array[5] =~ /utg/){
        $hash_query_anchor_contig2{$array[0]}{$array[5]} = 1;
    }
}
close PAF;


foreach my $contig (sort keys %hash_query_length){
    open KAR, ">$contig.k.txt" or die;
    foreach my $contig1 (sort keys %{$hash_query_anchor_contig1{$contig}}){
        print KAR "$contig1\t";
    }
    print KAR "\n$contig:1:$hash_query_length{$contig}\n";
    foreach my $contig2 (sort keys %{$hash_query_anchor_contig2{$contig}}){
        print KAR "$contig2\t";
    }
    close KAR;
}
        
sub usage{
    my $die =<<DIE;
    usage : perl *.pl ZmB73_5b_FGS_genes.align_Mo17_scaffold.paf
    ## this script is used to get the files to draw colinear plot by linkview
DIE
}
