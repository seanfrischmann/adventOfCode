#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use Digest::MD5 qw(md5 md5_hex md5_base64);

my $puzzle = 'ugkcyxxp';
my $test = 'abc';

my $result = '';

my $i = 0;
while (length $result < 8) {
    my $hex = md5_hex($puzzle . $i);
    my $isChar = $hex =~ /^00000/;

    if ($isChar) {
        my $char = substr($hex, 5, 1);

        $result .= $char;
        print "md5Hex: $hex  sixth char: $char  result: $result\n";
    }

    $i++;
}
