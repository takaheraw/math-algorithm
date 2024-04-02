fn binary_search<T: PartialOrd>(sorted_slice: &[T], target: &T) -> Option<usize> {
    let mut left = 0;
    let mut right = sorted_slice.len() - 1;

    while left <= right {
        let mid = left + (right - left) / 2;
        if sorted_slice[mid] == *target {
            return Some(mid);
        } else if sorted_slice[mid] < *target {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    None
}

fn main() {
    let sorted_vector = vec![1, 3, 5, 7, 9];
    let target = 5;

    match binary_search(&sorted_vector, &target) {
        Some(index) => println!("Target found at index {}", index),
        None => println!("Target not found in the vector"),
    }
}
