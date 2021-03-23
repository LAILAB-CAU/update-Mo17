#!/usr/bin/perl
use strict;
use warnings;

my ($id,$corr) = @ARGV;
open NEW, "$id" or die;
my %hashID;
while(<NEW>){
    chomp;
    my ($seq,$theID) = split /\s+/;
    $hashID{$seq} = $theID;
}
close NEW;

my %hashIDCO;
open NEW, "$corr" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    my ($ref,$query) = ($array[0],$array[1]);
    push @{$hashIDCO{$hashID{$ref}}}, $hashID{$query};
}
close NEW;

foreach my $sequence (sort {$a <=> $b} keys %hashIDCO){
    print "$sequence\t".join("\t",@{$hashIDCO{$sequence}})."\n";
}