#!/usr/bin/env node

function range(start, end) {
    var arr = [];
    for (var i = start; i <= end; ++i) {
        arr.push(i);
    }
    return arr;
}

function nqueens(size) {
    function queen(n) {
        if (n <= 0) {
            return [[]];
        } else {
            return queen(n-1).map(function(x) { return range(1, size).filter(function(y) { return x.indexOf(y) == -1 && Object.keys(x).map(function(i) { return x.length-i-Math.abs(y-x[i]); }).indexOf(0) == -1; }).map(function(y) { return x.concat(y); }); }).reduce(function(x, y) { return x.concat(y); });
        }
    }
    return queen(size);
}

console.log(nqueens(process.argv[2]).map(function(x) { return x.join(' '); }).join('\n'));
