#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper qw(Dumper);


my $file = 'puzzle1';
open(my $handle, '<:encoding(UTF-8)', $file)
  or die "Could not open file '$file' $!";
 
my $puzzle = <$handle>;
chomp $puzzle;
my @directions = split(/, /, $puzzle);

my %coords = ();

sub updatePosition {
    my $pos = shift;
    my $dir = shift;
    my $cor = shift;
    my $res = shift;

    my $rotation = substr($dir, 0, 1);
    my $steps = substr($dir, 1);

    if ($pos->{current} eq 'x') {
        $pos->{current} = 'y';
    } else {
        $pos->{current} = 'x';
    }

    my $isNeg = 0;
    my $start = $pos->{$pos->{current}};

    if ($rotation eq 'R') {
        if ($pos->{last} eq 'n') {
            $pos->{$pos->{current}} += $steps;
            $pos->{last} = 'e';
        } elsif ($pos->{last} eq 'e') {
            $pos->{$pos->{current}} -= $steps;
            $pos->{last} = 's';
            $isNeg = 1;
        } elsif ($pos->{last} eq 's') {
            $pos->{$pos->{current}} -= $steps;
            $pos->{last} = 'w';
            $isNeg = 1;
        } else {
            $pos->{$pos->{current}} += $steps;
            $pos->{last} = 'n';
        }
    } else {
        if ($pos->{last} eq 'n') {
            $pos->{$pos->{current}} -= $steps;
            $pos->{last} = 'w';
            $isNeg = 1;
        } elsif ($pos->{last} eq 'e') {
            $pos->{$pos->{current}} += $steps;
            $pos->{last} = 'n';
        } elsif ($pos->{last} eq 's') {
            $pos->{$pos->{current}} += $steps;
            $pos->{last} = 'e';
        } else {
            $pos->{$pos->{current}} -= $steps;
            $pos->{last} = 's';
            $isNeg = 1;
        }
    }

    for (my $i = 0; $i < $steps; $i++) {
        my $curCoords;
        my $total;

        if ($pos->{current} eq 'x') {
            my $x;

            if ($isNeg) {
                $x = $start - $i;
                $curCoords = '(' . $x . ',' . $pos->{y} . ')';
            } else {
                $x = $start + $i;
                $curCoords = '(' . $x . ',' . $pos->{y} . ')';
            }

            my $y = ($pos->{y} < 0) ? $pos->{y} * -1 : $pos->{y};
            $total = ($x < 0) ? $x * -1 : $x;
            $total += $y;

        } else {
            my $y;

            if ($isNeg) {
                $y = $start - $i;
                $curCoords = '(' . $pos->{x} . ',' . $y . ')';
            } else {
                $y = $start + $i;
                $curCoords = '(' . $pos->{x} . ',' . $y . ')';
            }

            my $x = ($pos->{x} < 0) ? $pos->{x} * -1 : $pos->{x};
            $total = ($y < 0) ? $y * -1 : $y;
            $total += $x;
        }

        if (exists $cor->{$curCoords}) {
            if (not exists $res->{problem2}) {
                $res->{problem2} = $total;
            }
        } else {
            $cor->{$curCoords} = 1;
        }
    }

}

my %results;

my %positions = (
    'last' => 'n',
    'current' => 'x',
    'x' => 0,
    'y' => 0,
);

foreach my $direction (@directions) {
    updatePosition(\%positions, $direction, \%coords, \%results);
}

$positions{x} = ($positions{x} < 0) ? $positions{x} * -1 : $positions{x};
$positions{y} = ($positions{y} < 0) ? $positions{y} * -1 : $positions{y};
$results{problem1} = $positions{x} + $positions{y};

print "The result to Problem 1 is: " . $results{problem1} . "\n";
print "The result to Problem 2 is: " . $results{problem2} . "\n";
