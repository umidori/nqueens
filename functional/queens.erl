-module(q).
-export([main/1]).

main([Arg]) ->
    Size = list_to_integer(atom_to_list(Arg)),
    io:format(string:join(lists:map(fun(X)->string:join(lists:map(fun(Y)->integer_to_list(Y) end, lists:reverse(lists:map(fun(Y)->element(2,Y) end, X))), " ") ++ "~n" end, nqueens(Size)), "")),
    init:stop().

nqueens(Size) ->
    Queen =
    fun (_, 0) -> [[]];
        (Recur, N) ->
            lists:flatmap(
                fun(X)->lists:map(
                            fun(Y)->[{N,Y}|X] end,
                            lists:filter(
                                fun(Y)->not lists:any(fun(Z)->Z==Y end,
                                            lists:map(fun(Z)->element(2,Z) end, X)) and
                                        not lists:any(fun(Z)->Z==0 end,
                                            lists:map(fun(Z)->N-element(1,Z)-abs(Y-element(2,Z)) end, X))
                                end,
                                lists:seq(1, Size)))
                end, Recur(Recur, N - 1)) end,
    Queen(Queen, Size).
