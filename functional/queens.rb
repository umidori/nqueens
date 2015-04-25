#!/usr/bin/env ruby

def nqueens(size)
    queen = lambda do |n|
        if n <= 0 then
            [[]]
        else
           queen.call(n-1).map{|x| (1..size).select{|y| !x.include?(y) && !x.map.with_index{|e,i| (y-e).abs-(x.length-i)}.include?(0)}.map{|y| x+[y]}}.flatten(1)
        end
    end
    queen.call(size)
end

puts nqueens(ARGV[0].to_i).map{|x| x.join(' ')}
