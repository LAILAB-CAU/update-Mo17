#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($pseudomolecule,$bed) = @ARGV;

my %hash_scaffolds;
my $seq_name1;
my %hash_sca_seq;
open NEW,"$pseudomolecule" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
    $hash_scaffolds{$array[0]} = $array[1];
    # if(/>/){
	# 	$_ =~ s/>//;
	# 	my @array = split /\s+/;
	# 	$seq_name1 = $array[0];
	# }
	# else{
	# 	$hash_scaffolds{$seq_name1} .= $_;
	# }
}
close NEW;


my %hashBed;
open NEW, "$bed" or die;
while(<NEW>){
    chomp;
    my @array = split /\s+/;
    $hashBed{$array[0]}{"$array[1]\t$array[2]"} = $array[3];
}
close NEW;


# $scale决定比例尺 my $scale = 200;说明200bp为一个像素
my $scale = 1000;
# $step_len决定刻度的密度 $step_len = 1000说明每1Kb一个刻度
my $step_len = 10000;
## draw the bar chart of ref_genome chromosomes
my $add_y = 100;

my $turn = 0;
foreach my $key(sort {$hash_scaffolds{$b} <=> $hash_scaffolds{$a}} keys %hash_scaffolds){
# foreach my $key(sort {length($hash_scaffolds{$b}) <=> length($hash_scaffolds{$a})} keys %hash_scaffolds){
    my $svg = SVG->new(width=>1000, height=>150);
    my $length = $hash_scaffolds{$key};
    # my $length = length($hash_scaffolds{$key});
    $turn += 1;
    # if($length > 130000){
    #     $scale = 1200;
    #     $step_len = 10000;
    # }

    
    my $y_loc = $add_y;
    $svg->rectangle(x=>50,y=>$y_loc,width=>$length/$scale,height=>10,fill=>'grey',stroke=>'none',style => {'stroke-width'   => '0.001'});
    $svg->text(x =>600,y =>$y_loc-30, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>15, "-cdata" => "$key:$length bp");
    my $yyy = $y_loc;
    $svg->rectangle(x=>50,y=>$yyy,width=>$length/$scale,height=>1,fill=>'black',stroke=>'none');
    for(my $magnitude = 0;$magnitude <= $length;$magnitude+= $step_len ){
        my $label = $magnitude/1000;
        $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-2,width=>0.5,height=>1,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        if($magnitude%(5*$step_len) == 0){
            $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-3,width=>0.7,height=>3,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
            if($magnitude%(10*$step_len) == 0){
                $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-5,width=>2, height=>5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
                $svg->text(x =>50+$magnitude/$scale,y =>$yyy-5, width => 2, height => 5, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>7, "-cdata" => "$label Kb");
            }
        }
        else{
            $svg->rectangle(x=>50+$magnitude/$scale,y=>$yyy-1.5,width=>0.5,height=>1.5,fill=>'black',stroke=>'none',style => {'stroke-width'   => '0.001'});
        }
    }

    foreach my $loc(keys %{$hashBed{$key}}){
        my ($start,$end) = split /\s+/,$loc;
        my $length = $end-$start;
        $svg->rectangle(x=>50+($start/$scale),y=>$y_loc,width=>$length/$scale,height=>10,fill=>"$hashBed{$key}{$loc}",stroke=>'none',style => {'stroke-width'   => '0.001'});
    }
    
    my $out = $svg->xmlify;
    my $output = "$key.svg";
    open SVGFILE,">$output" or die;
    print SVGFILE $out;
    close SVGFILE;
    system("singularity exec /public1/home/sc30797/wangzijian/software/img/inkscape.img inkscape --file $key.svg --export-pdf $key.pdf");
}



sub usage{
	my $die =<<DIE;
	usage : perl *.pl longmi.sca.fasta foxtail_millet.chr.fa *.coords output.SVG 
DIE
}
