#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle4');
my $test = "aaaaa-bbb-z-y-x-123[abxyz]\na-b-c-d-e-f-g-h-987[abcde]\ntotally-real-room-200[decoy]\nnot-a-real-room-404[oarel]\n";
my $result;

foreach (split(/\n/, $test)) {
    chomp;

    my ($code, $id, $room) = m/([^\d]+)-(\d+)\[(.+)\]/;
    my %sequence;

    foreach (split(//, $code)) {
        if ($_ ne'-') {
            $sequence{$_}++;
        }
    }

    my @sequence = sort {
        $sequence{$b} <=> $sequence{$a} || $a cmp $b
    } keys %sequence;

    if ($room eq substr(join('', @sequence), 0, 5)) {
        $result += $id;
    }
}

print "The result is: $result\n";
