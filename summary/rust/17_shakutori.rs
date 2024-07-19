fn shakutori(arr: &[i32], k: i32) -> i32 {
    let n = arr.len();
    let mut res = 0;
    let mut right = 0;
    let mut sum = 0;

    for left in 0..n {
        while right < n && sum + arr[right] <= k {
            sum += arr[right];
            right += 1;
        }

        res += (right - left) as i32;

        if right == left {
            right += 1;
        } else {
            sum -= arr[left];
        }
    }

    res
}

fn main() {
    let input_array: Vec<i32> = vec![1, 2, 3, 4, 5];
    let k = 5;
    let result = shakutori(&input_array, k);
    println!("Number of subarrays with sum <= {}: {}", k, result);
}
