function gcd(a: number, b: number): number {
  // ベースケース
  if (b === 0) {
    return a;
  }
  
  // 再帰的にgcd(b, a % b)を計算
  return gcd(b, a % b);
}

function lcm(a: number, b: number): number {
  // 0の場合は0を返す
  if (a === 0 || b === 0) {
    return 0;
  }
  
  // aとbの積をaとbの最大公約数で割って最小公倍数を求める
  return (a * b) / gcd(a, b);
}

console.log(lcm(24, 18)); // 出力: 72
console.log(lcm(110, 112)); 
