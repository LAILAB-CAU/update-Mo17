#!/usr/bin/perl
use strict;
use warnings;

my ($len_id,$drawfile) = @ARGV;

my %hashL;
my %hashID;
open LEN, "$len_id" or die;
while(<LEN>){
    chomp;
    my @array = split(/\s+/,$_);
    $hashL{$array[0]} = $array[1];
    $hashID{$array[0]} = $array[2];
}
close LEN;

my %hashLine;
open NEW, "$drawfile" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/; 
    print "$hashID{$array[0]}:$array[0]\t$hashID{$array[1]}:$array[1]\t$array[2]\t$array[3]\t$array[4]\t$array[5]\n";
    # $hashLine{$array[0]} = "$hashID{$array[0]}:$array[0]\t$hashID{$array[1]}:$array[1]\t$array[2]\t$array[3]\t$array[4]\t$array[5]";
}
close NEW; 

# foreach my $read (sort {$hashL{$b} <=> $hashL{$a} } keys %hashLine){
#     print "$hashLine{$read}\n";
# }
