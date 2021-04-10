#!/usr/bin/perl
use warnings;
use strict;
use SVG;
die "Usage:perl $0 B73_chromosome_length LH244_chromosome_length mummer_output\n" if(@ARGV!=3);

my %len_b73;
open A,$ARGV[0] or die $!;
while(<A>)
{
	chomp;
	my @a=split;
	$len_b73{$a[0]}=$a[1];
}
close A;

my %len_lh244;
open B,$ARGV[1] or die $!;
while(<B>)
{
	chomp;
	my @a=split;
	$len_lh244{$a[0]}=$a[1];
}
close B;

my $svg=SVG->new(width=>1800,height=>2000);
my $bp_per_pix=200000;

my %pos_b73;
my %pos_lh244;
for(my $i=1;$i<11;$i++)
{
	my $x1=150;
	my $y1=($i-1)*180+100;
	my $chr="chr".$i;
	my $x2=$len_b73{$chr}/$bp_per_pix + 150;
	my $y2=($i-1)*180+100;
	$pos_b73{$chr}=$y1;
	#B73染色体的颜色
	$svg->line(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,'stroke'=>'#FF9224','stroke-width'=>20,'fill'=>'#FF9224');
	my $chr_name1="V1_".$chr;
	my $text_x=0;
	my $text_y=$y1+5;
	$svg->text(x=>$text_x,y=>$text_y,'font-size'=>25,)->cdata("$chr_name1");


}

my %hashContigChr = (
	'Contig1'=>1,
	'Contig2'=>1,
	'Contig3'=>1,
	'Contig4'=>2,
	'Contig5'=>2,
	'Contig6'=>2,
	'Contig7'=>2,
	'Contig8'=>3,
	'Contig9'=>4,
	'Contig10'=>5,
	'Contig11'=>6,
	'Contig12'=>6,
	'Contig13'=>6,
	'Contig14'=>7,
	'Contig15'=>8,
	'Contig16'=>8,
	'Contig17'=>8,
	'Contig18'=>9,
	'Contig19'=>9,
	'Contig20'=>10
);

my %hashleft_len = (
	'Contig1'=>0,
	'Contig2'=>$len_lh244{Contig1},
	'Contig3'=>$len_lh244{Contig1} + $len_lh244{Contig2},
	'Contig4'=>0,
	'Contig5'=>$len_lh244{Contig4},
	'Contig6'=>$len_lh244{Contig4} + $len_lh244{Contig5},
	'Contig7'=>$len_lh244{Contig4} + $len_lh244{Contig5} + $len_lh244{Contig6},
	'Contig8'=>0,
	'Contig9'=>0,
	'Contig10'=>0,
	'Contig11'=>0,
	'Contig12'=>$len_lh244{Contig11},
	'Contig13'=>$len_lh244{Contig11} + $len_lh244{Contig12},
	'Contig14'=>0,
	'Contig15'=>0,
	'Contig16'=>$len_lh244{Contig15},
	'Contig17'=>$len_lh244{Contig15} + $len_lh244{Contig16},
	'Contig18'=>0,
	'Contig19'=>$len_lh244{Contig18},
	'Contig20'=>0
);

for(my $i=1;$i<21;$i++){
	my $chr="Contig".$i;
	my $x1=150 + $hashleft_len{$chr}/$bp_per_pix;
	$pos_lh244{$chr}=($hashContigChr{$chr}-1)*180+200;
	my $y1 = $pos_lh244{$chr};
	my $x2=$len_lh244{$chr}/$bp_per_pix + 150 + $hashleft_len{$chr}/$bp_per_pix;
	my $y2=$pos_lh244{$chr};
	#LH244染色体的颜色
	$svg->line(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,stroke=>'#2894FF','stroke-width'=>20,fill=>'#2894FF');
	my $chr_name2="V2_".$chr;
	# $text_x=0;
	# $text_y=$y1+5;
	# $svg->text(x=>$text_x,y=>$text_y,'font-size'=>25,)->cdata("$chr_name2");
	$svg->line(x1=>$x1,y1=>$y1-10,x2=>$x1,y2=>$y1+40,stroke=>'red','stroke-width'=>0.2,fill=>'black');
	$svg->text(x=>$x1,y=>$y1+10,'font-size'=>15,"text-anchor" => 'start')->cdata("$chr_name2");
}


my $kedu_y=1900;
my $kedu=int($len_b73{chr1}/10000000)+1;
my $x_start=150;
my $y_start=0;
my $x1=$x_start;
my $y1=$kedu_y;
my $x2=$x_start+$kedu*10000000/$bp_per_pix;
my $y2=$kedu_y;
$svg->line(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,'stroke','black','stroke-width',3,'fill','black',);
for(my $i=0;$i<=$kedu;$i++)
{
	if($i%5==0)
	{
		my $x1=$x_start+$i*10000000/$bp_per_pix;
		my $y1=$y_start+$kedu_y-20;
		my $x2=$x_start+$i*10000000/$bp_per_pix;
		my $y2=$y_start+$kedu_y;
		$svg->line(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,'stroke','black','stroke-width',3,'fill','black',);
		my $cdata;
		my $text_x;
		my $text_y;
		if($i==0)
		{
			$cdata=0;
			$text_x=$x_start+$i*10000000/$bp_per_pix-4;
			$text_y=$y_start+$kedu_y+35;
		}
		else
		{
			$cdata=$i*10;
			$cdata=$cdata."Mb";
			$text_x=$x_start+$i*10000000/$bp_per_pix-25;
			$text_y=$y_start+$kedu_y+35;
		}
		$svg->text(x=>$text_x,y=>$text_y-2,'font-size'=>25,)->cdata("$cdata");
	}
	else
	{
		my $x1=$x_start+$i*10000000/$bp_per_pix;
		my $y1=$y_start+$kedu_y-10;
		my $x2=$x_start+$i*10000000/$bp_per_pix;
		my $y2=$y_start+$kedu_y;
		$svg->line(x1=>$x1,y1=>$y1,x2=>$x2,y2=>$y2,'stroke','black','stroke-width',2,'fill','black',);
	}
}


open C,$ARGV[2] or die $!;
while(<C>)
{
	chomp;
	my @a=split(/\s+/);
	#my @a=split(/\t/);
	next if("chr".$hashContigChr{$a[0]} ne $a[5]);
	# my $len=abs($a[7]-$a[2]);
	# next if($len>10000000);
	my $x1=$a[7]/$bp_per_pix+150;
	my $y1=$pos_b73{$a[5]}+20;
	my $x2=$a[8]/$bp_per_pix+150;
	my $y2=$pos_b73{$a[5]}+20;
	my $x3=($hashleft_len{$a[0]} + $a[3])/$bp_per_pix+150;
	my $y3=$pos_lh244{$a[0]}-20;
	my $x4=($hashleft_len{$a[0]} + $a[2])/$bp_per_pix+150;
	my $y4=$pos_lh244{$a[0]}-20;
	#设置线的颜色
	$svg->polygon(points=>"$x1,$y1,$x2,$y2,$x3,$y3,$x4,$y4",fill=>'#A9A886',);
}
close C;

my $svg_name="mummer_compare.svg";
open OUTPUT, ">$svg_name";
print OUTPUT $svg->xmlify;
close OUTPUT;

#system("/NAS2/sunsl/pav/distributing_svg_4.74/svg2xxx_release/svg2xxx ".$svg_name." -t png");
