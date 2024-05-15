fn sieve_of_eratosthenes(max: usize) -> Vec<usize> {
    let mut sieve = vec![true; max + 1];
    let mut primes = Vec::new();

    for i in 2..=max {
        if sieve[i] {
            primes.push(i);
            let mut multiple = i * i;
            while multiple <= max {
                sieve[multiple] = false;
                multiple += i;
            }
        }
    }

    primes
}

fn main() {
    let max_number = 30;
    let primes = sieve_of_eratosthenes(max_number);
    println!("Primes up to {}: {:?}", max_number, primes);
}
