#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle2');

my %keypad = (
    '1' => { 'R' => 2, 'D' => 4 },
    '2' => { 'D' => 5, 'L' => 1, 'R' => 3 },
    '3' => { 'D' => 6, 'L' => 2 },
    '4' => { 'R' => 5, 'U' => 1, 'D' => 7 },
    '5' => { 'R' => 6, 'L' => 4, 'U' => 2, 'D' => 8 },
    '6' => { 'L' => 5, 'U' => 3, 'D' => 9 },
    '7' => { 'U' => 4, 'R' => 8 },
    '8' => { 'U' => 5, 'L' => 7, 'R' => 9 },
    '9' => { 'U' => 6, 'L' => 8 }
);

my $test = "ULL\nRRDDD\nLURDL\nUUUUD\n";

my $current = 5;
my $result;

foreach my $instructions (split(/\n/, $file)) {
    print "INSTRUCTIONS\n$instructions\n\n";
    foreach (split(//, $instructions)) {
        chomp;
        print "Direction: $_ \n";
        if (exists $keypad{$current}{$_}) {
            print "keypad: $keypad{$current}{$_} \n";
        }

        print "current: $current\n";
        $current = (exists $keypad{$current}{$_}) ? $keypad{$current}{$_} : $current;
        print "next: $current\n";
    }

    $result .= $current;
}

print "The result is $result\n";
