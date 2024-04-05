// 最大公約数を求める関数
fn gcd(a: u64, b: u64) -> u64 {
    if b == 0 {
        a
    } else {
        gcd(b, a % b)
    }
}

// 最小公倍数を求める関数
fn lcm(a: u64, b: u64) -> u64 {
    a / gcd(a, b) * b
}

fn main() {
    let a = 15;
    let b = 20;
    println!("{} と {} の最小公倍数は {}", a, b, lcm(a, b));
}
