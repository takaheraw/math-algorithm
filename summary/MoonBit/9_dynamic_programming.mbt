fn fibonacci(n: Int, memo: &mut List<Option<Int>>) -> Int {
  if n <= 1 {
    return n
  }

  if memo[n].is_some() {
    return memo[n].unwrap()
  }

  memo[n] = Some(fibonacci(n - 1, memo) + fibonacci(n - 2, memo))
  return memo[n].unwrap()
}

fn main {
  let n = 10
  let mut memo = List<Option<Int>>::new_with_size(n + 1, None)
  let result = fibonacci(n, &mut memo)
  println("The ", n, "th Fibonacci number is: ", result)
}
