open Array;;

let () =
    let size = int_of_string Sys.argv.(1) in
    let row = make size true
    and up = make (2 * size - 1) true
    and down = make (2 * size - 1) true
    and board = make size 0 in
    let rec queen n =
        if n >= size then begin
            for i = 0 to size - 2 do begin
                print_int board.(i); print_char ' '
            end done;
            print_int board.(size - 1); print_char '\n'
        end else
            for i = 0 to size - 1 do
                if row.(i) && up.(n+i) && down.(n-i+size-1) then begin
                    row.(i)<-false; up.(n+i)<-false; down.(n-i+size-1)<-false;
                    board.(n)<-i + 1;
                    queen(n + 1);
                    row.(i)<-true; up.(n+i)<-true; down.(n-i+size-1)<-true
                end
            done in
    queen 0;;
