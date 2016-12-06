#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use Digest::MD5 qw(md5 md5_hex md5_base64);
use syntax 'junction';

my $puzzle = 'ugkcyxxp';
my $test = 'abc';

my @positions = ();
my $result = 'XXXXXXXX';

my $i = 0;
while (scalar @positions < 8) {
    my $hex = md5_hex($puzzle . $i);
    my $isChar = $hex =~ /^00000/;
    my $pos = substr($hex, 5, 1);

    if ($isChar && $pos =~ /[0-7]/ && none(@positions) eq $pos) {
        my $char = substr($hex, 6, 1);

        push @positions, $pos;
        substr($result, $pos, 1, $char);
        print "md5Hex: $hex  seventh char: $char result: $result\n";
    }

    $i++;
}

