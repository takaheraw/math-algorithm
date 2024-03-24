function gcd(a: number, b: number): number {
  // ベースケース: bが0の場合、aが最大公約数
  if (b === 0) {
    return a;
  }

  // aをbで割った余りをcとする
  const c = a % b;

  // bとcの最大公約数を再帰的に求める
  return gcd(b, c);
}

console.log(gcd(24, 18)); // 6
console.log(gcd(30, 20)); // 10
