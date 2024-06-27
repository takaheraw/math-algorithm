class SegmentTree {
    private tree: number[];
    private n: number;

    constructor(data: number[]) {
        this.n = data.length;
        this.tree = new Array(2 * this.n);
        this.build(data);
    }

    private build(data: number[]): void {
        // Initialize leaves
        for (let i = 0; i < this.n; i++) {
            this.tree[this.n + i] = data[i];
        }

        // Build the tree by calculating parents
        for (let i = this.n - 1; i > 0; i--) {
            this.tree[i] = this.tree[2 * i] + this.tree[2 * i + 1];
        }
    }

    public update(index: number, value: number): void {
        // Set value at position p
        index += this.n;
        this.tree[index] = value;

        // Move upward and update parents
        while (index > 1) {
            index = Math.floor(index / 2);
            this.tree[index] = this.tree[2 * index] + this.tree[2 * index + 1];
        }
    }

    public query(left: number, right: number): number {
        // sum on interval [left, right)
        let result = 0;
        left += this.n;
        right += this.n;

        while (left < right) {
            if (left % 2 === 1) {
                result += this.tree[left];
                left++;
            }
            if (right % 2 === 1) {
                right--;
                result += this.tree[right];
            }
            left = Math.floor(left / 2);
            right = Math.floor(right / 2);
        }

        return result;
    }
}

// Example usage
const data = [1, 3, 5, 7, 9, 11];
const segTree = new SegmentTree(data);

// Query the sum in the range [1, 4)
console.log(segTree.query(1, 4)); // 3 + 5 + 7 = 15

// Update the value at index 2 to 10
segTree.update(2, 10);

// Query again
console.log(segTree.query(1, 4)); // 3 + 10 + 7 = 20
