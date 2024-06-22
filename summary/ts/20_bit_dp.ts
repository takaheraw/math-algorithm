function bitDP(weights: number[], values: number[], capacity: number): number {
    const n: number = weights.length;
    const dp: number[] = new Array(1 << n).fill(0);

    for (let s = 1; s < (1 << n); s++) {
        for (let i = 0; i < n; i++) {
            if (s & (1 << i)) {
                const prevSubset = s ^ (1 << i);
                if (weights[i] <= capacity) {
                    dp[s] = Math.max(dp[s], dp[prevSubset] + values[i]);
                }
            }
        }
    }

    return dp[(1 << n) - 1];
}

// Example usage:
const weights = [2, 3, 4, 5];
const values = [3, 4, 5, 6];
const capacity = 5;
const maxValue: number = bitDP(weights, values, capacity);
console.log(`Maximum value using bit DP: ${maxValue}`);
