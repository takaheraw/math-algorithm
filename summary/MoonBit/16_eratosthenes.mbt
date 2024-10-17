fn sieve_of_eratosthenes(n: Int) -> List<Bool> {
  let mut is_prime = List<Bool>::new_with_size(n + 1, true)

  // 0と1は素数ではない
  is_prime[0] = false
  is_prime[1] = false

  // 2からsqrt(n)までの素数を使って倍数を除外する
  let mut p = 2
  while p * p <= n {
    if is_prime[p] {
      // pの倍数をすべて素数リストから除外
      let mut i = p * p
      while i <= n {
        is_prime[i] = false
        i = i + p
      }
    }
    p = p + 1
  }

  return is_prime
}

fn main {
  let n = 50
  let is_prime = sieve_of_eratosthenes(n)

  // 素数を出力
  println("Prime numbers up to ", n, ":")
  for i = 2; i <= n; i = i + 1 {
    if is_prime[i] {
      println(i)
    }
  }
}
