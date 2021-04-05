#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($ref1Bed,$ref2Bed,$corr) = @ARGV;

my ($ref1name,$ref1Start,$ref1End) = ((split /[:]/, $ref1Bed)[0], (split /-/,(split /[:]/, $ref1Bed)[1])[0], (split /-/,(split /[:]/, $ref1Bed)[1])[1]);	#获得x轴的序列范围
my $length1 = $ref1End - $ref1Start;	#x轴的序列长度
my ($ref2name,$ref2Start,$ref2End) = ((split /[:]/, $ref2Bed)[0], (split /-/,(split /[:]/, $ref2Bed)[1])[0], (split /-/,(split /[:]/, $ref2Bed)[1])[1]);	#获得y轴的序列范围
my $length2 = $ref2End - $ref2Start;	#y轴的序列长度

my $svg = SVG->new(width=>600, height=>600);	#确定画布大小

my $scale;
my $step_len;
# 根据序列长度决定比例尺
if($length1 <= 1000000){
	$scale = 1000;
	$step_len = 10000;
}
elsif($length1 <= 10000000){
	$scale = 1000;
	$step_len = 10000;
}
else{
	$scale = 100000;
	$step_len = 1000000;
}

my $y_loc = 50;
my $x_loc = 50;
#X轴及其刻度
$svg->line(x1=>$x_loc, 	x2=>$x_loc + ($length1)/$scale,	#横坐标
	y1=>$y_loc-2,y2=>$y_loc-2, 	#纵坐标
	stroke=>"black", "stroke-width" => "2"); #线条颜色和粗细 line的坐标是以其中线为准的

$svg->text(x =>$x_loc,
	y =>$y_loc-2-10, width => 2, height => 5, 
	"font-family"=>"Arial", ,"text-anchor"=>"start","font-size"=>7, "-cdata" => "$ref1name");

my $labelStart = $step_len * (int($ref1Start/$step_len)+1);
for(my $magnitude = $labelStart;$magnitude <= $ref1Start + $length1;$magnitude+= $step_len ){
	my $label = $magnitude/1000;
	if($magnitude%(5*$step_len) == 0){
		
		if($magnitude%(10*$step_len) == 0){
			$svg->line(x1=>$x_loc+($magnitude - $ref1Start)/$scale,x2=>$x_loc+($magnitude - $ref1Start)/$scale ,
				y1=>$y_loc-2, y2=> $y_loc-2-5,
				stroke=>"black", "stroke-width" => "1");
			$svg->text(x =>$x_loc+($magnitude - $ref1Start)/$scale,
				y =>$y_loc-2-5, width => 2, height => 5, 
				"font-family"=>"Arial", ,"text-anchor"=>"middle","font-size"=>7, "-cdata" => "$label Kb");
			next;
		}
		$svg->line(x1=>$x_loc+($magnitude - $ref1Start)/$scale,x2=>$x_loc+($magnitude - $ref1Start)/$scale ,
				y1=>$y_loc-2, y2=> $y_loc-2-3,
				stroke=>"black", "stroke-width" => "0.35");
	}
	else{
		$svg->line(x1=>$x_loc+($magnitude - $ref1Start)/$scale,x2=>$x_loc+($magnitude - $ref1Start)/$scale ,
				y1=>$y_loc-2, y2=> $y_loc-2-1.5,
				stroke=>"black", "stroke-width" => "0.25");
	}
}

#Y轴及其刻度
$svg->line(x1=>$x_loc-2, 	x2=>$x_loc-2,	#横坐标
	y1=>$y_loc,y2=>$y_loc + ($length2)/$scale, 	#纵坐标
	stroke=>"black", "stroke-width" => "2"); #线条颜色和粗细 line的坐标是以其中线为准的

$svg->text(x =>$x_loc-2-2-30,
	y =>$y_loc+50, width => 2, height => 5, 
	"font-family"=>"Arial", ,"text-anchor"=>"end","font-size"=>7, transform=>"rotate(-90,16,100)","-cdata" => "$ref2name");

$labelStart = $step_len * (int($ref2Start/$step_len)+1);
for(my $magnitude = $labelStart;$magnitude <= $ref2Start + $length2;$magnitude+= $step_len ){
	my $label = $magnitude/1000;
	if($magnitude%(5*$step_len) == 0){
		
		if($magnitude%(10*$step_len) == 0){
			$svg->line(y1=>$y_loc+($magnitude - $ref2Start)/$scale,y2=>$y_loc+($magnitude - $ref2Start)/$scale ,
				x1=>$x_loc-2, x2=> $x_loc-2-5,
				stroke=>"black", "stroke-width" => "1");
			$svg->text(y =>$y_loc+($magnitude - $ref2Start)/$scale,
				x =>$x_loc-2-10, width => 2, height => 5, 
				"font-family"=>"Arial", ,"text-anchor"=>"end","font-size"=>7, transform=>"rotate(-90,$x_loc-2-10,$y_loc+($magnitude - $ref2Start)/$scale)","-cdata" => "$label Kb");
			next;
		}
		$svg->line(y1=>$y_loc+($magnitude - $ref2Start)/$scale,y2=>$y_loc+($magnitude - $ref2Start)/$scale ,
				x1=>$x_loc-2, x2=> $x_loc-2-3,
				stroke=>"black", "stroke-width" => "0.35");
	}
	else{
		$svg->line(y1=>$y_loc+($magnitude - $ref2Start)/$scale,y2=>$y_loc+($magnitude - $ref2Start)/$scale ,
				x1=>$x_loc-2, x2=> $x_loc-2-1.5,
				stroke=>"black", "stroke-width" => "0.25");
	}
}


my %hashColor = (100 => 'rgb(255,0,0)' ,#红 
98.5 => 'rgb(255,26,26)'  ,   #红10%  
97 => 'rgb(255,51,51)'   ,  #  20%  
95.5 => 'rgb(255,77,77)'   ,  #  30%  
94 => 'rgb(255,102,102)' ,  #  40%  
92.5 => 'rgb(255,128,128)' ,  #  50%  
91 => 'rgb(255,153,153)' ,  #  60%  
89.5 => 'rgb(255,179,179)' ,  #  70%  
88 => 'rgb(255,204,204)' ,  #  80%  
86.5 => 'rgb(255,230,230)' ,  #  90%     
85 => 'rgb(230,230,255)' ,  #  90%  
83.5 => 'rgb(204,204,255)' ,  #  80%  
82 => 'rgb(179,179,255)' ,  #  70%  
80.5 => 'rgb(153,153,255)' ,  #  60%  
79 => 'rgb(128,128,255)' ,  #  50%  
77.5 => 'rgb(102,102,255)' ,  #  40%  
76 => 'rgb(77,77,255)'   ,  #  30%  
74.5 => 'rgb(51,51,255)'   ,  #  20%  
73 => 'rgb(26,26,255)',     #蓝10%  
71.5 => 'rgb(0,0,255)'	,  #蓝
70 => 'rgb(255,255,255)'); #黑


open CORR, "$corr" or die;
while(<CORR>){ 
	chomp;
	my ($seq2,$seq1,$identity) = split /\s+/;
	my ($seq1name,$seq1start,$seq1end) = ((split /[:]/, $seq1)[0], (split /-/,(split /[:]/, $seq1)[1])[0], (split /-/,(split /[:]/, $seq1)[1])[1]);
	my ($seq2name,$seq2start,$seq2end) = ((split /[:]/, $seq2)[0], (split /-/,(split /[:]/, $seq2)[1])[0], (split /-/,(split /[:]/, $seq2)[1])[1]);
	my $fill;
	foreach my $idcutoff (sort{$b <=> $a} keys %hashColor){
		if($identity - $idcutoff >=0 and $identity - $idcutoff <1.5){
			$fill = $hashColor{int($idcutoff)};
			next;
		}		
	}
	
	$svg->rectangle(x=>$x_loc+($seq1start - $ref1Start)/$scale,y=>$y_loc+($seq2start - $ref2Start)/$scale,width=>($seq1end-$seq1start)/$scale,height=>($seq2end-$seq2start)/$scale,fill=>$fill,stroke=>'none',style => {'stroke-width'   => '0.001'});
}

my $out = $svg->xmlify;
my $output = "$corr.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $corr.pdf");
system("rm $corr.svg")
