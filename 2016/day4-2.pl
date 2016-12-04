#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle4');
my $test = "qzmt-zixmtkozy-ivhz-343[abcde]";
my $result;
my %input = (
    'a' => 'b',
    'b' => 'c',
    'c' => 'd',
    'd' => 'e',
    'e' => 'f',
    'f' => 'g',
    'g' => 'h',
    'h' => 'i',
    'i' => 'j',
    'j' => 'k',
    'k' => 'l',
    'l' => 'm',
    'm' => 'n',
    'n' => 'o',
    'o' => 'p',
    'p' => 'q',
    'q' => 'r',
    'r' => 's',
    's' => 't',
    't' => 'u',
    'u' => 'v',
    'v' => 'w',
    'w' => 'x',
    'x' => 'y',
    'y' => 'z',
    'z' => 'a',
);

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
                for (my $i = 0; $i < $id; $i++) {
                    $char = $input{$char};
                }

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
