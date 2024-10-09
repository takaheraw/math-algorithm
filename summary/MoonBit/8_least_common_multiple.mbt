fn gcd(a: Int, b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return gcd(b, a % b)
  }
}

fn lcm(a: Int, b: Int) -> Int {
  return (a * b) / gcd(a, b)
}

fn main {
  let num1 = 12
  let num2 = 18
  let result = lcm(num1, num2)
  println("The LCM of ", num1, " and ", num2, " is: ", result)
}
