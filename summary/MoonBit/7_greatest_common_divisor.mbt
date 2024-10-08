fn gcd(a: Int, b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return gcd(b, a % b)
  }
}

fn main {
  let num1 = 48
  let num2 = 18
  let result = gcd(num1, num2)
  println("The GCD of ", num1, " and ", num2, " is: ", result)
}
