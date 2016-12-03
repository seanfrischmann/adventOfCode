#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle2');

my %keypad = (
    '1' => { 'D' => 3 },
    '2' => { 'D' => 6, 'R' => 3 },
    '3' => { 'D' => 7, 'L' => 2, 'R' => 4, 'U' => 1 },
    '4' => { 'L' => 3, 'D' => 8 },
    '5' => { 'R' => 6 },
    '6' => { 'L' => 5, 'U' => 2, 'D' => 'A', 'R' => 7 },
    '7' => { 'U' => 3, 'R' => 8, 'L' => 6, 'D' => 'B' },
    '8' => { 'U' => 4, 'L' => 7, 'R' => 9, 'D' => 'C' },
    '9' => { 'L' => 8 },
    'A' => { 'U' => 6, 'R' => 'B'},
    'B' => { 'U' => 7, 'D' => 'D', 'L' => 'A', 'R' => 'C' },
    'C' => { 'U' => 8, 'L' => 'B'},
    'D' => { 'U' => 'B'},
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
