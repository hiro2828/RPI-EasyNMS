#!/usr/bin/perl
use Time::Piece;
use strict;
use warnings;

# the file name of your .csv file
my $file = 'oid.csv'; # OID to be questioned.
my $hostip = "192.168.1.101"; 
my @result;
my @array;
my $cnt = 0;
my $date;
my $t = localtime;

# open the file for reading
open(FILE, "<$file") or
 die("Could not open log file. $!\n");

 #process line by line:
while(<FILE>) {
 my($line) = $_;
 chomp($line);
 @array = split ',', $line;
 $result[$cnt] = `snmpget -v 1 -c public -Oqv $hostip $array[1]`;
 chomp($result[$cnt]);
 if ($array[0] ne '') {
   $result[$cnt] = $result[$cnt] * $array[0];
 }
 $cnt += 1;
}
 $date =  $t->strftime('%y-%m-%d_%H:%M:%S');
 print "$date";
 foreach (@result) { print ",$_" }

close(FILE);

