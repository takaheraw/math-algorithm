fn selection_sort<T: PartialOrd + Copy>(arr: &mut [T]) {
    for i in 0..arr.len() {
        let mut min_idx = i;
        for j in i + 1..arr.len() {
            if arr[j] < arr[min_idx] {
                min_idx = j;
            }
        }
        arr.swap(i, min_idx);
    }
}

fn main() {
    let mut arr = [5, 3, 8, 1, 7];
    selection_sort(&mut arr);
    println!("{:?}", arr); // [1, 3, 5, 7, 8]
}
