fn is_prime(n: Int) -> Bool {
  if n <= 1 {
    return false  // 1以下は素数ではない
  }
  if n == 2 {
    return true  // 2は素数
  }
  if n % 2 == 0 {
    return false  // 2以外の偶数は素数ではない
  }

  let mut i = 3
  while i * i <= n {
    if n % i == 0 {
      return false  // iで割り切れる場合は素数ではない
    }
    i = i + 2  // 奇数のみを調べる
  }

  return true  // 素数
}

fn main {
  let number = 29
  if is_prime(number) {
    println(number, " is a prime number.")
  } else {
    println(number, " is not a prime number.")
  }
}
