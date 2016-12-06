#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle4');
my $result;

foreach (split(/\n/, $file)) {
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
        my $roomName;
        foreach my $char (split(//,$code)) {
            if ($char eq '-') {
                $roomName .= ' ';
            } else {
                my $charCode = (ord($char) - ord('a') + $id) % 26;
                $char = chr($charCode + ord('a'));

                $roomName .= $char;
            }
        }

        if (index($roomName, 'object storage') != -1) {
            print "The code is: $code \n";
            print "The room is: $room \n";
            print "The id is: $id \n";
            print "The room name is: $roomName\n\n";
        }
    }
}
