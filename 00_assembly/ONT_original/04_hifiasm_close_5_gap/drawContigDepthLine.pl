#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$depthFile1,$depthFile2) = @ARGV;

my %hash_scaffolds;
my $seq_name1;
my %hash_sca_seq;
open NEW,"$pseudomolecule" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_scaffolds{"$array[0]\t$array[1]\t$array[2]"} = $array[2] - $array[1];
}
close NEW;

my %hashDepth;
open NEW,"$depthFile1" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	my ($depth1,$depth2);
    if($array[3] >=300){
        $depth1 = 300;
    }
    else{
        $depth1 = $array[3];
    }
	$hashDepth{$array[0]}{"$array[1]\t$array[2]"} = "$depth1\t$depth1";
}
close NEW;

my %hashDepth2;
open NEW,"$depthFile2" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	my ($depth1,$depth2);
    if($array[3] >=300){
        $depth1 = 300;
    }
    else{
        $depth1 = $array[3];
    }
	$hashDepth2{$array[0]}{"$array[1]\t$array[2]"} = "$depth1\t$depth1";
}
close NEW;



my $scale;
## draw the bar chart of ref_genome chromosomes
my $add_y = 100;

# my $turn = 0;
my @keyhash = keys %hash_scaffolds;
my $wcl = @keyhash;
my $svg;

my $count = 0;
my $lastKey;
my $theEndSeq;
# foreach my $key(sort {$hash_scaffolds{$b} cmp $hash_scaffolds{$a}} keys %hash_scaffolds){
foreach my $key(sort  keys %hash_scaffolds){

    my $length = $hash_scaffolds{$key};
    my $regionStart = (split /\s+/, $key)[1];
    my $regionEnd = (split /\s+/, $key)[2];
    my $seqName = (split /\s+/, $key)[0];

    my $countInPicture = $count % 1;
    my $thePictureSeq = int($count/1);
    $theEndSeq = $thePictureSeq + 1;
    if($countInPicture == 0){
        if($thePictureSeq >= 1){
            my $out = $svg->xmlify;
            my $output = "$lastKey.svg";
            open SVGFILE,">$output" or die;
            print SVGFILE $out;
            close SVGFILE;
            system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $lastKey.pdf");
        }
        $svg = SVG->new(width=>3500, height=>100*1 + 100);
    }
    my $step_len;
    # $scale决定比例尺 my $scale = 200;说明200bp为一个像素
    $scale = 100000;
	$step_len = 1000000;
	
	# if($length <= 1000000){
    #     $scale = 1000;
    #     $step_len = 10000;
    # }
    # elsif($length <= 10000000){
    #     $scale = 1000;
    #     $step_len = 10000;
    # }
    # else{
    #     $scale = 100000;
    #     $step_len = 1000000;
    # }
    # $step_len决定刻度的密度 $step_len = 1000说明每1Kb一个刻度
    

    
    my $y_loc = $add_y + 60 * $countInPicture;
    
    $svg->rectangle(x=>50,y=>$y_loc,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>350 + $length/$scale,y =>$y_loc+7, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"middle","font-size"=>10, "-cdata" => "$key:$length bp");
    my $yyy = $y_loc;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    
    my $labelStart = $step_len * (int($regionStart/$step_len)+1);
    for(my $magnitude = $labelStart;$magnitude <= $regionStart + $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;

        # $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        if($magnitude%(5*$step_len) == 0){
            
            if($magnitude%(10*$step_len) == 0){
                $svg->line(x1=>50+($magnitude - $regionStart)/$scale,x2=>50+($magnitude - $regionStart)/$scale,y1=>$yyy-5,y2=>$yyy,stroke=>'black','stroke-width'=> '1');
				# $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-5,width=>2, height=>5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
                $svg->text(x =>50+($magnitude - $regionStart)/$scale,y =>$yyy-5, width => 2, height => 5, "font-family"=>"Arial", "text-anchor"=>"middle","font-size"=>7, "-cdata" => "$label Kb");
                next;
            }
            $svg->line(x1=>50+($magnitude - $regionStart)/$scale,x2=>50+($magnitude - $regionStart)/$scale,y1=>$yyy-3,y2=>$yyy,stroke=>'black','stroke-width'=> '0.35');
			# $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-3,width=>0.7,height=>3,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
        else{
            $svg->line(x1=>50+($magnitude - $regionStart)/$scale,x2=>50+($magnitude - $regionStart)/$scale,y1=>$yyy-1.5,y2=>$yyy,stroke=>'black','stroke-width'=> '0.25');
			# $svg->rectangle(x=>50+($magnitude - $regionStart)/$scale,y=>$yyy-1.5,width=>0.5,height=>1.5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }


    foreach my $loc(keys %{$hashDepth2{$seqName}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        if($start <= $regionEnd and $end >= $regionStart){
			my @ss = ($start,$regionStart); @ss = sort {$b <=> $a} @ss;
			my @ee = ($end,$regionEnd); @ee = sort {$a <=> $b} @ee;
			my ($draw_s,$draw_e) = ($ss[0],$ee[0]);
			my ($depth1,$depth2) = split /\s+/,$hashDepth2{$seqName}{$loc};
            $svg->line(x1=>50+($draw_s - $regionStart)/$scale,x2=>50+($draw_s - $regionStart)/$scale + ($draw_e - $draw_s)/$scale, y1=>$y_loc-12-$depth1/5, y2=>$y_loc-12-$depth2/5, stroke=>'red','stroke-width'=> '0.25')
			# $svg->rectangle(x=>50+($draw_s - $regionStart)/$scale,y=>$y_loc-12-$hashDepth2{$seqName}{$loc}/5,width=>($draw_e - $draw_s)/$scale,height=>$hashDepth2{$seqName}{$loc}/5,fill=>"grey",stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }
	foreach my $loc(keys %{$hashDepth{$seqName}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        if($start <= $regionEnd and $end >= $regionStart){
			my @ss = ($start,$regionStart); @ss = sort {$b <=> $a} @ss;
			my @ee = ($end,$regionEnd); @ee = sort {$a <=> $b} @ee;
			my ($draw_s,$draw_e) = ($ss[0],$ee[0]);
            my ($depth1,$depth2) = split /\s+/,$hashDepth{$seqName}{$loc};
            $svg->line(x1=>50+($draw_s - $regionStart)/$scale,x2=>50+($draw_s - $regionStart)/$scale + ($draw_e - $draw_s)/$scale, y1=>$y_loc-12-$depth1/5, y2=>$y_loc-12-$depth2/5, stroke=>'blue','stroke-width'=> '0.25')
			# $svg->rectangle(x=>50+($draw_s - $regionStart)/$scale,y=>$y_loc-12-$hashDepth{$seqName}{$loc}/5,width=>($draw_e - $draw_s)/$scale,height=>$hashDepth{$seqName}{$loc}/5,fill=>"black",stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

	$svg->line(x1=>45,x2=>45,y1=>$y_loc-12,y2=>$y_loc-12-300/5,stroke=>'black','stroke-width'=> '0.35');
	for(my $depthLabel=0;$depthLabel<=300;$depthLabel+=50){
		$svg->line(x1=>43,x2=>45,y1=>$y_loc-12-$depthLabel/5,y2=>$y_loc-12-$depthLabel/5,stroke=>'black','stroke-width'=> '0.25');
		$svg->text(x =>40,y =>$y_loc-12-$depthLabel/5, width => 2, height => 3, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>5, "-cdata" => "$depthLabel");
	}


    $count += 1;
	$lastKey = $seqName;
}
my $out = $svg->xmlify;
my $output = "$lastKey.svg";
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;
system("source /public1/soft/modules/module.sh && module load singularity/singularity-2.6.0-yangzq && singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $output --export-pdf $lastKey.pdf");

sub usage{
	my $die =<<DIE;
	usage : perl *.pl longmi.sca.fasta foxtail_millet.chr.fa *.coords output.SVG 
DIE
}
