function quickSort(array: number[]): number[] {
    if (array.length <= 1) {
        return array;
    }

    const pivotIndex = Math.floor(array.length / 2);
    const pivot = array[pivotIndex];

    const left: number[] = [];
    const right: number[] = [];

    for (let i = 0; i < array.length; i++) {
        if (i === pivotIndex) {
            continue;
        }
        if (array[i] < pivot) {
            left.push(array[i]);
        } else {
            right.push(array[i]);
        }
    }

    return [...quickSort(left), pivot, ...quickSort(right)];
}

// テスト
const unsortedArray = [5, 3, 7, 2, 9, 1, 6, 4, 8];
const sortedArray = quickSort(unsortedArray);
console.log("ソート前:", unsortedArray);
console.log("ソート後:", sortedArray);
