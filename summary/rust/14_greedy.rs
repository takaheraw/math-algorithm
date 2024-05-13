use std::cmp::Reverse;

fn greedy_algorithm(values: &[i32], weights: &[i32], capacity: i32) -> (i32, Vec<usize>) {
    let mut items: Vec<(usize, i32, i32, f32)> = values.iter()
        .zip(weights.iter())
        .enumerate()
        .map(|(index, (&value, &weight))| (index + 1, value, weight, value as f32 / weight as f32))
        .collect();

    items.sort_by_key(|&(_, _, _, ratio)| Reverse(ratio.partial_cmp(&0.0).unwrap()));

    let mut total_value = 0;
    let mut total_weight = 0;
    let mut selected_items = Vec::new();

    for (index, value, weight, _) in items {
        if total_weight + weight <= capacity {
            selected_items.push(index);
            total_value += value;
            total_weight += weight;
        }
    }

    (total_value, selected_items)
}

fn main() {
    let values = vec![60, 100, 120];
    let weights = vec![10, 20, 30];
    let capacity = 50;
    let (total_value, selected_items) = greedy_algorithm(&values, &weights, capacity);
    println!("Total value: {}", total_value);
    println!("Items selected: {:?}", selected_items);
}
