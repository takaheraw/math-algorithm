fn knapsack(weights: &[i32], values: &[i32], capacity: i32) -> i32 {
    let n = weights.len();
    let mut dp = vec![vec![0; (capacity + 1) as usize]; n + 1];

    for i in 1..=n {
        for w in 1..=capacity as usize {
            if weights[i - 1] as usize <= w {
                dp[i][w] = dp[i][w].max(values[i - 1] + dp[i - 1][w - weights[i - 1] as usize]);
            } else {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }

    dp[n][capacity as usize]
}

fn main() {
    let weights: Vec<i32> = vec![2, 3, 4, 5];
    let values: Vec<i32> = vec![3, 4, 5, 6];
    let capacity = 5;
    let max_value = knapsack(&weights, &values, capacity);
    println!("Maximum value that can be accommodated: {}", max_value);
}
