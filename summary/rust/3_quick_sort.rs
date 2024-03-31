fn quicksort<T: PartialOrd + Copy>(arr: &mut [T]) {
   let len = arr.len();
   if len <= 1 {
       return;
   }

   let pivot = arr[len / 2];
   let mut left = 0;
   let mut right = len - 1;

   while left <= right {
       while arr[left] < pivot {
           left += 1;
       }

       while arr[right] > pivot {
           right -= 1;
       }

       if left <= right {
           arr.swap(left, right);
           left += 1;
           right -= 1;
       }
   }

   quicksort(&mut arr[..right + 1]);
   quicksort(&mut arr[left..]);
}

fn main() {
   let mut arr = [5, 3, 2, 8, 1, 7];
   quicksort(&mut arr);
   println!("{:?}", arr); // [1, 2, 3, 5, 7, 8]
}
