#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $puzzle = read_file('puzzle');
my $test = read_file('test');
my $result = 0;


sub checkTLS {
    my $count = 0;
    my @chars;
    my $string = shift;

    foreach my $char (split(//, $string)) {
        push @chars, $char;

        if (scalar @chars == 4) {
            my $firstTwo = $chars[0] . $chars[1];
            my $lastTwo = $chars[3] . $chars[2];

            if ($firstTwo eq $lastTwo && $chars[0] ne $chars[1]) {
                return 1;
            }

            shift @chars;

        }
    }

    return 0
}

foreach (split(/\n/, $puzzle)) {
    my @input = split(/\[|\]/);

    my $nonBracketsPass = 0;
    my $bracketsPass = 1;
    for (my $i = 0; $i < scalar @input; $i++) {
        if (checkTLS($input[$i])) {
            if ($i == 0 || $i % 2 == 0) {
                $nonBracketsPass = 1;
            } else {
                $bracketsPass = 0;
            }
        }

    }

    if ($bracketsPass && $nonBracketsPass) {
        $result++;
    }
}

print "The result is: $result\n";
