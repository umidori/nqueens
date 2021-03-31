use std::env;

fn main() {
    let size: usize = env::args().collect::<Vec<String>>()[1].parse().unwrap();

    let mut row = vec![true; size];
    let mut up = vec![true; 2*size-1];
    let mut down = vec![true; 2*size-1];
    let mut board: Vec<i32> = vec![0; size];

    queen(0, size, &mut board, &mut row, &mut up, &mut down);
}

fn queen(n: usize, size: usize, board: &mut Vec<i32>, row: &mut Vec<bool>, up: &mut Vec<bool>, down: &mut Vec<bool>) {
    if n >= size {
        for i in 0..(size-1) {
            print!("{} ", board[i]);
        }
        println!("{}", board[size-1]);
    } else {
        for i in 0..size {
            if row[i] && up[n+i] && down[n+size-i-1] { 
                row[i] = false;
                up[n+i] = false;
                down[n+size-i-1] = false;
                board[n] = i as i32 + 1;
                queen(n+1, size, board, row, up, down);
                row[i] = true;
                up[n+i] = true;
                down[n+size-i-1] = true;
            }
        }
    }
}
