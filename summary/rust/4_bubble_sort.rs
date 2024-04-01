fn bubble_sort<T: PartialOrd>(arr: &mut [T]) {
    let n = arr.len();
    for i in 0..n {
        for j in 0..n-i-1 {
            if arr[j] > arr[j+1] {
                arr.swap(j, j+1);
            }
        }
    }
}

fn main() {
    let mut arr = [5, 2, 9, 1, 5, 6];
    bubble_sort(&mut arr);
    println!("{:?}", arr); // [1, 2, 5, 5, 6, 9]
}
