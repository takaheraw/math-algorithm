use rand::Rng;

fn simulated_annealing<F>(initial_solution: Vec<i32>, cost_function: F) -> Vec<i32>
where
    F: Fn(&Vec<i32>) -> i32,
{
    let mut current_solution = initial_solution.clone();
    let mut current_cost = cost_function(&current_solution);
    let mut temperature = 100.0;
    let min_temperature = 0.01;
    let alpha = 0.9;
    let mut rng = rand::thread_rng();

    while temperature > min_temperature {
        let mut next_solution = current_solution.clone();
        let i = rng.gen_range(0..current_solution.len());
        let j = rng.gen_range(0..current_solution.len());
        next_solution.swap(i, j);
        let next_cost = cost_function(&next_solution);

        if next_cost < current_cost || (f64::exp((current_cost - next_cost) as f64 / temperature) > rng.gen::<f64>()) {
            current_solution = next_solution;
            current_cost = next_cost;
        }

        temperature *= alpha;
    }

    current_solution
}

// Example usage:
fn main() {
    let input_array: Vec<i32> = vec![1, 2, 3, 4, 5];
    let optimized_array = simulated_annealing(input_array, |arr| arr.iter().map(|&num| num * num).sum());
    println!("Optimized Array using Simulated Annealing: {:?}", optimized_array);
}
