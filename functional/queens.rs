use std::env;

fn main() {
    let size: i32 = env::args().collect::<Vec<String>>()[1].parse().unwrap();

    print!("{}", nqueens(size, size).iter().
           map(|x| x.iter().map(|y| y.to_string()).collect::<Vec<_>>().join(" ")+"\n").collect::<Vec<_>>().join(""));
}

fn nqueens(n: i32, size: i32) -> Vec<Vec<i32>> {
    if n <= 0 {
        return vec![Vec::<i32>::new()];
    } else {
        return nqueens(n-1,size).iter()
            .flat_map(|x| (1..=size).into_iter()
                     .filter(move |y| !x.contains(y) && !x.iter().enumerate().map(move |(i,e)| (y-e).abs()-(x.len() as i32-i as i32)).collect::<Vec<_>>().contains(&0))
                     .map(move |y| {let mut v=Vec::<i32>::new(); v.extend(x.iter()); v.push(y); v}).collect::<Vec<_>>()).collect::<Vec<_>>();
    }
}
