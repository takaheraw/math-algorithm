// フィボナッチ数列を計算する関数
function fibonacci(n: number): number {
  // メモ化用の配列を初期化
  const memo: number[] = new Array(n + 1).fill(0);

  // 基底ケース
  memo[0] = 0;
  memo[1] = 1;

  // 動的計画法のループ
  for (let i = 2; i <= n; i++) {
    memo[i] = memo[i - 1] + memo[i - 2];
  }

  return memo[n];
}

// 使用例
console.log(fibonacci(6)); // 8
console.log(fibonacci(10)); // 55
