#!/usr/bin/env ruby

def nqueens(size)
    row = Array.new(size, true)
    up = Array.new(2*size-1, true)
    down = Array.new(2*size-1, true)
    board = Array.new(size)
    queen = lambda do |n|
        if n >= size then
            puts board.join(' ')
        else
            size.times do |i|
                if row[i] && up[n+i] && down[n-i] then
                   row[i] = up[n+i] = down[n-i] = false
                   board[n] = i+1
                   queen.call(n+1)
                   row[i] = up[n+i] = down[n-i] = true
                end
            end
        end
    end
    queen.call(0)
end

nqueens(ARGV[0].to_i)
