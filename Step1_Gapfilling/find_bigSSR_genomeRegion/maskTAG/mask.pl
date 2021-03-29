#!/usr/env/perl
use strict;
use warnings;

open NEW, "$ARGV[0]" or die;
while (<NEW>){
    chomp;
    if($_ =~ /^>/){
        print "$_\n";
        next;
    }
    $_ =~ tr/a-z/N/;
    print "$_\n";
}
close NEW;