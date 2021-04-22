#!/usr/bin/perl
use	strict;
use	warnings;
die	usage()	if	@ARGV	==	0;
my	($contig,$statistics)	=	@ARGV;


my	%hash_len;#
open	NEW,"$contig"	or	die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	$hash_len{$array[0]}	=	$array[1];
}
close	NEW;


my	@array_length;
my	$total_length;
my	$total_contig_number	=	keys	%hash_len;
foreach	my	$seq_name(keys	%hash_len){
	$total_length+=$hash_len{$seq_name};
	push	@array_length,$hash_len{$seq_name};
}

open	NEW,">$statistics"	or	die;
print	NEW	"Total	contig	length:	$total_length(bp)	\n";
print	NEW	"Total	contig	number:	$total_contig_number	\n";
my	@sorted_array_length	=	sort	{$b	<=>	$a}	@array_length;
print	NEW	"Longest	contig	length:	$sorted_array_length[0](bp)	\n";
my	$adding_length	=	0;
my	$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
				$adding_length	+=	$line;
				$adding_contig_number++;
				if($adding_length	>=	$total_length*0.1){
								print	NEW	"N10	length:	$line	(bp)	Number=$adding_contig_number	\n";
								last;
				}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.2){
																print	NEW	"N20	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.3){
																print	NEW	"N30	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.4){
																print	NEW	"N40	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.5){
																print	NEW	"N50	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.6){
																print	NEW	"N60	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.7){
																print	NEW	"N70	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.8){
																print	NEW	"N80	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
$adding_length	=	0;
$adding_contig_number	=	0;
foreach	my	$line(@sorted_array_length){
								$adding_length	+=	$line;
				$adding_contig_number++;
								if($adding_length	>=	$total_length*0.9){
																print	NEW	"N90	length:	$line	(bp)	Number=$adding_contig_number	\n";
																last;
								}
}
my	%hash_density;	#
my	$density_step=10000;	#
foreach	my	$contig_length	(@sorted_array_length)
{
				my	$yu=$contig_length%$density_step;
				my	$length_in=$contig_length-$yu;
				if($hash_density{$length_in})
				{
								$hash_density{$length_in}++;
				}
				else	{$hash_density{$length_in}=1;}
}
foreach	my	$key	(sort	{$a	<=>	$b}	keys	%hash_density)
{
				print	NEW	"$hash_density{$key}		$key	\n";
}
close	NEW;
sub	usage{
				my	$die	=<<DIE;
				usage	:	perl	*.pl	Mo17.contigs.fasta	output.statistics
				##	this	script	was	used	to	calculate	the	statistics	of	contigs
DIE
}
