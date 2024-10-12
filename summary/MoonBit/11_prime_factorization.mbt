fn prime_factors(n: Int) -> List<Int> {
  let mut factors = List<Int>::new()
  let mut num = n

  // 2で割り切れる限り割る
  while num % 2 == 0 {
    factors.push(2)
    num = num / 2
  }

  // 3以上の奇数で割り切れる限り割る
  let mut i = 3
  while i * i <= num {
    while num % i == 0 {
      factors.push(i)
      num = num / i
    }
    i = i + 2
  }

  // 最後に残った素数がある場合
  if num > 2 {
    factors.push(num)
  }

  return factors
}

fn main {
  let number = 315
  let result = prime_factors(number)
  println("Prime factors of ", number, " are: ", result)
}
