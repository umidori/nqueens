#!/usr/bin/env php
<?php
function array_flatten($arr) {
    $ret = array();
    array_walk($arr, function($v) use (&$ret) {
        if (is_array($v)) {
            $ret = array_merge($ret, $v);
        } else {
            $ret[] = $v;
        }
    });
    return $ret;
}

function nqueens($size) {
    $queen = function($n) use (&$queen, &$size) {
        if ($n <= 0) {
            return [[]];
        } else {
            return array_flatten(array_map(function($x) use (&$size) {
                return array_map(function($y) use (&$x) {
                    return array_merge($x, [$y]); }, array_filter(range(1, $size), function($y) use (&$x) {
                        return !in_array($y, $x) && !in_array(0, array_map(function($i) use (&$x, &$y) {
                            return count($x)-$i-abs($y-$x[$i]); },
                                array_keys($x))); })); }, $queen($n-1)));
        }
    };
    return $queen($size);
}

$l = nqueens($argv[1]);
echo join('', array_map(function($x) { return join(' ', $x) . "\n"; }, $l));
?>
