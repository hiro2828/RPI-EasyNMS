#!/usr/bin/perl
     
    print "Content-type:text/html\n\n";
     
    my $filename="output.csv";
    my $starttime="null";
    my $endtime="null";
    my $fectype="null";
    my $lostpkt=0;
    my $restored=0;
    my $iprate=0;
    my $sbs=0;
    my $arqbuffer=0;
    my $cnt=0;
    my $sum1=0;
    my $max;
    my $maxtime;
    my $ave;
    my $sum2=0;
    my $LRave=0;
    my $pktcnt = 0;
     
    if (@ARGV > 0) {
	$filename = $ARGV[0];
    }
    open(FILEHANDLE, $filename) or die "Could not open $filename $!\n";
     
    while (my $line = <FILEHANDLE>) {
      chomp $line;
#
# (0) Date, (1) IP Rate, (2) Lost, (3) Restored, (4) Recieved, (5) FEC/ARQ, 
# (6) DF, (7) LR, (8) SBS, (9) ARQ Buffer
#
      my @fields = split "," , $line;
      if ($cnt == 0) {
      } else {
if ($starttime == "null") { $starttime = $fields[0]; }
        $sum1 += $fields[6];
        if ($DFmax < $fields[6]) {
		$DFmax = $fields[6];
		$maxtime = $fields[0];
        }
        $sum2 += $fields[7];
	$pktcnt = $fields[4];
	$iprate = $fields[1];
	$lostpkt = $fields[2];
	$restored = $fields[3];
	$sbs = $fields[8];
	$arqbuffer = $fields[9];
	$endtime = $fields[0];
	if($fields[5] == 0) { $fectype = "None"; }
	if($fields[5] == 1) { $fectype = "ProMPEG"; }
	if($fields[5] == 2) { $fectype = "ARQ"; }
      }
      $cnt += 1;
    }
    $cnt -= 1;
    $DFave = $sum1 / $cnt;
    $LRave = $sum2 / $cnt;
    printf("<h1> Stats Info from MVD5000 </h1> <br />", $starttime);
    printf(" Started at : %s <br />", $starttime);
    printf(" Ended at : %s <br />", $endtime);
    printf(" PktCnt : %d <br /> DF(ave/max): %.1f ms / %.1f ms @%s <br /> LR(ave): %.2fpkt/sec <br />", $pktcnt, $DFave, $DFmax, $maxtime, $LRave);
    printf(" FEC Type     : %s <br />", $fectype);
    printf(" IP rate      : %d kbps <br />", $iprate);
    printf(" Lost pkt     : %d / %1.2f % <br />", $lostpkt, $lostpkt / $pktcnt * 100);
    printf(" Restored pkt : %d / %1.2f % <br />", $restored, $restored / $pktcnt * 100);
    printf(" ARQ buffer   : %d ms <br />", $arqbuffer);
    printf(" SBS          : %d ms <br />", $sbs);

    close(FILEHANDLE);

