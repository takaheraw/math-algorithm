class UnionFind {
    private parent: number[];
    private rank: number[];

    constructor(size: number) {
        this.parent = new Array(size).fill(0).map((_, index) => index);
        this.rank = new Array(size).fill(0);
    }

    public find(x: number): number {
        if (this.parent[x] !== x) {
            this.parent[x] = this.find(this.parent[x]);
        }
        return this.parent[x];
    }

    public union(x: number, y: number): void {
        const rootX = this.find(x);
        const rootY = this.find(y);

        if (rootX !== rootY) {
            if (this.rank[rootX] > this.rank[rootY]) {
                this.parent[rootY] = rootX;
            } else if (this.rank[rootX] < this.rank[rootY]) {
                this.parent[rootX] = rootY;
            } else {
                this.parent[rootY] = rootX;
                this.rank[rootX] += 1;
            }
        }
    }

    public connected(x: number, y: number): boolean {
        return this.find(x) === this.find(y);
    }
}

// Example usage
const uf = new UnionFind(10);
uf.union(1, 2);
uf.union(2, 3);
console.log(uf.connected(1, 3)); // true
console.log(uf.connected(1, 4)); // false
