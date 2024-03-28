function primeFactors(n: number): number[] {
  const factors: number[] = [];
  let divisor = 2;

  while (n >= 2) {
    if (n % divisor === 0) {
      factors.push(divisor);
      n = n / divisor;
    } else {
      divisor++;
    }
  }

  return factors;
}

// 使用例
console.log(primeFactors(12)); // [2, 2, 3]
console.log(primeFactors(100)); // [2, 2, 5, 5]
