#! /usr/bin/perl

use strict;

my $file = $ARGV[0];
my $file2 = $ARGV[1];
my $field = $ARGV[2];

open(FH, $file2);
my @list = <FH>;
close(FH);

my $user_info;
foreach my $line( @list ) {
    my @fact = split('\t' , $line , 2);
    my $user_id = $fact[0];
    chomp($user_id);
    $user_info->{$user_id}->{'value'} = trim($fact[1]);
}

open(ID , $file);
my @ids = <ID>;
close(ID);

foreach my $id( @ids ) {
  
    chomp($id);
    if($user_info->{$id})
    {
	print $id."\t".$user_info->{$id}->{'value'}."\n";
    }
  else
  {
      print $id;
      for (my $i = 1; $i <= $field; $i++){print "\t0";}
      print "\n";
  }

}

sub trim {
    my @out = @_;
    for (@out) {
	s/^\s+//;
	s/\s+$//;
    }
    return wantarray ? @out : $out[0];
}
