#!/usr/bin/env php
<?php
    function nqueens($size) {
        $row = array_fill_keys(range(0, $size-1), True);
        $up = array_fill_keys(range(0, 2*$size-2), True);
        $down = array_fill_keys(range(-$size+1, $size-1), True);
        $board;
        $queen = function($n) use (&$queen, &$size, &$row, &$up, &$down, &$board) {
            if ($n >= $size) {
                echo implode(' ', $board), "\n";
            } else {
                for ($i = 0; $i < $size; ++$i) {
                    if ($row[$i] && $up[$n+$i] && $down[$n-$i]) {
                        $row[$i] = $up[$n+$i] = $down[$n-$i] = False;
                        $board[$n] = $i+1;
                        $queen($n+1);
                        $row[$i] = $up[$n+$i] = $down[$n-$i] = True;
                    }
                }
            }
        };
        $queen(0);
    }
    nqueens($argv[1]);
?>
