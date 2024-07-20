use std::collections::HashMap;

fn half_enumeration(arr: &[i32], target_sum: i32) -> i32 {
    let n = arr.len();
    let half = n / 2;

    let mut first_half_subsets = HashMap::new();
    for i in 0..(1 << half) {
        let mut sum = 0;
        for j in 0..half {
            if i & (1 << j) != 0 {
                sum += arr[j];
            }
        }
        *first_half_subsets.entry(sum).or_insert(0) += 1;
    }

    let mut second_half_subsets = HashMap::new();
    for i in 0..(1 << (n - half)) {
        let mut sum = 0;
        for j in 0..(n - half) {
            if i & (1 << j) != 0 {
                sum += arr[half + j];
            }
        }
        *second_half_subsets.entry(sum).or_insert(0) += 1;
    }

    let mut count = 0;
    for (sum1, count1) in first_half_subsets.iter() {
        let needed = target_sum - sum1;
        if let Some(count2) = second_half_subsets.get(&needed) {
            count += count1 * count2;
        }
    }

    count
}

fn main() {
    let input_array: Vec<i32> = vec![1, 2, 3, 4, 5, 6];
    let target_sum = 10;
    let result = half_enumeration(&input_array, target_sum);
    println!("Number of ways to achieve sum {}: {}", target_sum, result);
}
