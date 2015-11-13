#!/usr/bin/perl
     
    print "Content-type:text/html\n\n";
     
    my $cnt=0;
    my $sum1=0;
    my $max;
    my $maxtime;
    my $ave;
    my $sum2=0;
     
    open(FILEHANDLE, "<output.csv") or die "Could not open 'output.csv' $!\n";
     
    while (my $line = <FILEHANDLE>) {
      chomp $line;

      my @fields = split "," , $line;
      if ($cnt == 0) {
      } else {
        $sum1 += $fields[6];
        if ($max < $fields[6]) {
		$max = $fields[6];
		$maxtime = $fields[0];
        }
        $sum2 += $fields[7];
      }
      $cnt += 1;
    }
    $cnt -= 1;
    $ave = $sum1 / $cnt;
    print "$cnt, DF MAX=$max($maxtime), DF AVE=$ave, LR=$sum2\n";
     
    close(FILEHANDLE);

