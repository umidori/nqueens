#!/usr/bin/env perl

sub nqueens {
    $size=shift;
    $queen = sub {
        $n = shift;
        if ($n <= 0) {
            [];
        } else {
            map {@x=@$_; $l=scalar(@x); map {[@x, $_]} grep {$y=$_; !grep {$y==$x[$_] || $l-$_==abs($y-$x[$_])} 0..$size-1} 1..$size} $queen->($n-1);
        }
    };
    $queen->($size);
}

print map {join(' ', @$_),"\n"} nqueens($ARGV[0]);
