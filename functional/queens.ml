open List;;

let rec range a b =
    if a > b then
        []
    else
        a :: range (a+1) b;;

let nqueens size =
    let rec queen n =
        if n <= 0 then
            [[]]
        else
            concat (map (fun x->map (fun y->(n,y)::x)
                            (filter (fun y->((not (mem y (map snd x))) &&
                                    (not (mem 0 (map (fun z->n-fst z-abs(y-snd z))
                                    x))))) (range 1 size)))
                            (queen (n-1))) in
    queen size;;

let () = print_endline (String.concat "\n" (map (fun x->String.concat " "
                (rev (map (fun y->string_of_int (snd y)) x))) (nqueens
                (int_of_string Sys.argv.(1)))));;
