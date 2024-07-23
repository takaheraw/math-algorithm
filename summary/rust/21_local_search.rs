fn local_search_algorithm<F>(arr: &mut [i32], cost_function: F) -> Vec<i32>
where
    F: Fn(&[i32]) -> i32,
{
    let n = arr.len();
    let mut best_solution = arr.to_vec();
    let mut best_cost = cost_function(&best_solution);

    loop {
        let mut current_solution = best_solution.clone();
        let mut improved = false;

        for i in 0..n {
            for j in i + 1..n {
                current_solution.swap(i, j);
                let current_cost = cost_function(&current_solution);
                if current_cost < best_cost {
                    best_solution = current_solution.clone();
                    best_cost = current_cost;
                    improved = true;
                }
                current_solution.swap(i, j);
            }
        }

        if !improved {
            break;
        }
    }

    best_solution
}

// Example usage:
fn main() {
    let mut input_array = vec![4, 3, 2, 1];
    let best_array = local_search_algorithm(&mut input_array, |arr| arr.iter().map(|&num| num * num).sum());
    println!("Optimized Array: {:?}", best_array);
}
