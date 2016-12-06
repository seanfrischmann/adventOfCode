#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle3');
my $test = " 5 10 25\n";
my $result = 0;


foreach (split(/\n/, $file)) {
    chomp;

    my @tri = split(/ /);
    @tri = grep(/\S/, @tri);

    my $sum1 = $tri[0] + $tri[1];
    my $sum2 = $tri[1] + $tri[2];
    my $sum3 = $tri[0] + $tri[2];

    if ($sum1 > $tri[2] and $sum2 > $tri[0] and $sum3 > $tri[1]) {
        print "INSTRUCTIONS\n$_\n\n";
        $result++;
        print $result . "\n";
    }
}

print "The result is $result\n";

