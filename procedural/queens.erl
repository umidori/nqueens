-module(queen).
-export([main/1]).

main([Arg]) ->
    Size = list_to_integer(atom_to_list(Arg)),
    Row = array:new(Size, {default, true}),
    Up = array:new(2 * Size - 1, {default, true}),
    Down = array:new(2 * Size - 1, {default, true}),
    Board = array:new(Size, {default, 0}),
    queen(0, Size, Row, Up, Down, Board),
    init:stop().

queen(Size, Size, _, _, _, Board) ->
    for(0, Size - 2, fun(I) -> io:format("~p ", [array:get(I, Board)]) end),
    io:format("~p~n", [array:get(Size - 1, Board)]);

queen(N, Size, Row, Up, Down, Board) ->
    for(0, Size - 1,
        fun(I) ->
                case array:get(I, Row)
                    and array:get(N+I, Up)
                    and array:get(N-I+Size-1, Down) of
                    true ->
                        queen(N + 1,
                            Size,
                            array:set(I, false, Row),
                            array:set(N+I, false, Up),
                            array:set(N-I+Size-1, false, Down),
                            array:set(N, I+1, Board));
                    false ->
                        none
                end
        end).

for(M, M, F) -> [F(M)];
for(I, M, F) -> [F(I) | for(I+1, M, F)].
