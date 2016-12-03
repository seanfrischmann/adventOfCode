#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle3');
my $test = " 5 10 25\n";
my $result = 0;

my %placeholders = (
    0 => [],
    1 => [],
    2 => [],
);

sub checkTriangle {
    my $tri = shift;

    my $sum1 = $tri->[0] + $tri->[1];
    my $sum2 = $tri->[1] + $tri->[2];
    my $sum3 = $tri->[0] + $tri->[2];

    if ($sum1 > $tri->[2] && $sum2 > $tri->[0] && $sum3 > $tri->[1]) {
        $result++;
    }
}

foreach (split(/\n/, $file)) {
    chomp;

    my @row = split(/ /);
    @row = grep(/\S/, @row);

    push($placeholders{0}, $row[0]);
    push($placeholders{1}, $row[1]);
    push($placeholders{2}, $row[2]);

    if (scalar @{$placeholders{0}} == 3) {
        checkTriangle(\@{$placeholders{0}});
        checkTriangle(\@{$placeholders{1}});
        checkTriangle(\@{$placeholders{2}});

        $placeholders{0} = [];
        $placeholders{1} = [];
        $placeholders{2} = [];
    }
}

print "The result is $result\n";

