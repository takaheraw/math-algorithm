fn prime_factors(mut n: u64) -> Vec<u64> {
    let mut factors = Vec::new();
    let mut divisor = 2;
    while n > 1 {
        while n % divisor == 0 {
            factors.push(divisor);
            n /= divisor;
        }
        divisor += 1;
    }
    factors
}

fn main() {
    let n = 60;
    println!("素因数分解結果: {:?}", prime_factors(n));
}
