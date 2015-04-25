#!/usr/bin/env perl

use strict;

sub nqueens {
    my $size = shift;
    my @row = (1) x $size;
    my @up = (1) x (2*$size-1);
    my @down = (1) x (2*$size-1);
    my @board;
    my $queen;
    $queen = sub {
        my $n = shift;
        if ($n >= $size) {
            print join(' ', @board), "\n";
        } else {
            for (0..($size-1)) {
                if ($row[$_] && $up[$n+$_] && $down[$n-$_]) {
                    $row[$_] = $up[$n+$_] = $down[$n-$_] = 0;
                    $board[$n] = $_+1;
                    $queen->($n+1);
                    $row[$_] = $up[$n+$_] = $down[$n-$_] = 1;
                }
            }
        }
    };
    $queen->(0);
}

nqueens(shift @ARGV);
