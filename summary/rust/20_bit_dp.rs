fn bit_dp(weights: &[i32], values: &[i32], capacity: i32) -> i32 {
    let n = weights.len();
    let mut dp = vec![0; 1 << n];

    for s in 1..(1 << n) {
        for i in 0..n {
            if s & (1 << i) != 0 {
                let prev_subset = s ^ (1 << i);
                if weights[i] <= capacity {
                    dp[s] = dp[s].max(dp[prev_subset] + values[i]);
                }
            }
        }
    }

    dp[(1 << n) - 1]
}

fn main() {
    let weights: Vec<i32> = vec![2, 3, 4, 5];
    let values: Vec<i32> = vec![3, 4, 5, 6];
    let capacity = 5;
    let max_value = bit_dp(&weights, &values, capacity);
    println!("Maximum value using bit DP: {}", max_value);
}
