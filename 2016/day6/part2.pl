#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);
use File::Slurp;

my $file = read_file('puzzle');

my %chars;

foreach (split(/\n/, $file)) {
    my @charArray = split(//);

    for (my $i = 0; $i < scalar @charArray; $i++) {
        $chars{$i}{$charArray[$i]}++;
    }
}

my $result;
for (my $i = 0; $i < scalar keys %chars; $i++) {

    my $char;
    foreach (keys $chars{$i}) {
        if (!$char) {
            $char = $_;
            next;
        }

        if ($chars{$i}{$char} > $chars{$i}{$_}) {
            $char = $_;
        }
    }

    $result .= $char;
}

print "The result: $result\n";
