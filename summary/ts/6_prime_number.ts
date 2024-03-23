function isPrime(num: number): boolean {
  // 0と1は素数ではない
  if (num < 2) {
    return false;
  }

  // 2は最小の素数
  if (num === 2) {
    return true;
  }

  // 偶数は2を除いて素数ではない
  if (num % 2 === 0) {
    return false;
  }

  // 3から sqrt(num) までの奇数で割り切れるかチェック
  const sqrt = Math.sqrt(num);
  for (let i = 3; i <= sqrt; i += 2) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

// 使用例
console.log(isPrime(7)); // true
console.log(isPrime(10)); // false
console.log(isPrime(17)); // true
