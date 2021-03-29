open(F1,$ARGV[0]) or die "$!";
$i=0;#计算行数
$cut=$ARGV[1]; #每个shell的命令数目
while(my $line=<F1>){
	chomp $line;
	$i+=1;
	if($ARGV[1]!=1){
		if($i%$cut==1){
			$var=int($i/$cut)+1;
			if($var!=1){
				print OUT "wait","\n";
			}
			open(OUT,">$ARGV[0]_$var") or die "$!";
			print OUT "#!/bin/bash","\n";
		}
		print OUT $line,"\n";
	}else{
		$var=$i/$cut;
		open(OUT,">$ARGV[0]_$var") or die "$!";
		print OUT "#!/bin/bash","\n";
		print OUT $line,"\n";
		print OUT "wait","\n";
	}
}
print OUT "wait","\n";