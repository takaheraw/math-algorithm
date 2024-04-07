fn main() {
    let visitors = vec![62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39];
    let mut accumulates = vec![0; visitors.len() + 1];
    for i in 1..=visitors.len() {
        accumulates[i] = accumulates[i - 1] + visitors[i - 1];
    }
    let targets = vec![(2, 4), (4, 13)];
    for (l, r) in targets.iter() {
        println!("{}日目から{}日目までの来場者数", l, r);
        println!("{}", accumulates[*r] - accumulates[l - 1]);
    }
}
