fn is_prime(n: u64) -> bool {
  if n <= 1 {
    return false;
  }

  for i in 2..n {
    if n % i == 0 {
      return false;
    }
  }

  true
}

fn main() {
    println!("{}", is_prime(7)); // true
    println!("{}", is_prime(10)); // false
    println!("{}", is_prime(23)); // true
}
