#!/bin/env/perl
use warnings;
use strict;

die "I need input fasta, repeat unit and output file" if @ARGV != 3;
my ($inputFasta,$repeatUnit,$outputPattern) = @ARGV;
open INFA, "$inputFasta" or die "input fasta missing";
open OUTFA, ">$outputPattern" or die "output fasta missing";
my %hashInputFasta;
my $currentSeq;
while(my $iFline=<INFA>){
    chomp $iFline;
    if($iFline=~/^>/){
        $currentSeq = $iFline =~ s/>//r;
    }
    else{
        $hashInputFasta{$currentSeq} .= $iFline;
    }
}
close INFA;

while(my($seqName,$seq) = each %hashInputFasta){
    print OUTFA ">$seqName\n";
    my @matches;
    while($seq =~ m/($repeatUnit)+/gi){
        my ($before,$hit,$after) = ($`,$&,$');
        my @before_this_match = split(/($repeatUnit)+/i,$before);
        if($before_this_match[-1]){
            print OUTFA "$before_this_match[-1]\n";
        }
        # print OUTFA "$hit\n";
        my $count = () = $hit =~ m/$repeatUnit/gi;
        print OUTFA "($repeatUnit)$count\n";
        unless($after =~ m/$repeatUnit/i){
            print OUTFA "$after\n";
        }
    }
}
close OUTFA;