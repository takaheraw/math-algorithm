fn merge_sort<T: PartialOrd + Copy>(arr: &mut [T]) {
    let mid = arr.len() / 2;
    if mid == 0 {
        return;
    }

    merge_sort(&mut arr[..mid]);
    merge_sort(&mut arr[mid..]);

    let mut tmp = vec![arr[0]; arr.len()];
    merge(&arr[..mid], &arr[mid..], &mut tmp[..]);
    arr.copy_from_slice(&tmp);
}

fn merge<T: PartialOrd + Copy>(left: &[T], right: &[T], result: &mut [T]) {
    let mut i = 0;
    let mut j = 0;
    let mut k = 0;

    while i < left.len() && j < right.len() {
        if left[i] < right[j] {
            result[k] = left[i];
            i += 1;
        } else {
            result[k] = right[j];
            j += 1;
        }
        k += 1;
    }

    if i < left.len() {
        result[k..].copy_from_slice(&left[i..]);
    } else {
        result[k..].copy_from_slice(&right[j..]);
    }
}

fn main() {
    let mut arr = [5, 3, 8, 1, 7];
    merge_sort(&mut arr);
    println!("{:?}", arr); // [1, 3, 5, 7, 8]
}
