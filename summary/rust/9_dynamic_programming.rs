// フィボナッチ数列を計算する関数
fn fibonacci(n: usize) -> usize {
    // メモ化用の配列を初期化
    let mut memo: Vec<usize> = vec![0; n + 1];

    // 基底ケース
    memo[0] = 0;
    memo[1] = 1;

    // 動的計画法のループ
    for i in 2..=n {
        memo[i] = memo[i - 1] + memo[i - 2];
    }

    memo[n]
}

fn main() {
    let a = 6;
    let b = 10;
    println!("{}", fibonacci(a));
    println!("{}", fibonacci(b));
}
