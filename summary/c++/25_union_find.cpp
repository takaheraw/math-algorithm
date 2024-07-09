#include <vector>
#include <iostream>

class UnionFind {
public:
    UnionFind(int size) : parent(size), rank(size, 0) {
        for (int i = 0; i < size; ++i) {
            parent[i] = i;
        }
    }

    int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]);
        }
        return parent[x];
    }

    void unionSets(int x, int y) {
        int rootX = find(x);
        int rootY = find(y);

        if (rootX != rootY) {
            if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else {
                parent[rootY] = rootX;
                rank[rootX]++;
            }
        }
    }

    bool connected(int x, int y) {
        return find(x) == find(y);
    }

private:
    std::vector<int> parent;
    std::vector<int> rank;
};

// 使用例
int main() {
    UnionFind uf(10);
    uf.unionSets(1, 2);
    uf.unionSets(2, 3);
    std::cout << std::boolalpha << uf.connected(1, 3) << std::endl; // true
    std::cout << std::boolalpha << uf.connected(1, 4) << std::endl; // false

    return 0;
}
