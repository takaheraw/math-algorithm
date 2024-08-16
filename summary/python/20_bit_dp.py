def bit_dp(weights, values, capacity):
    n = len(weights)
    dp = [0] * (1 << n)

    for s in range(1, 1 << n):
        for i in range(n):
            if s & (1 << i):
                prev_subset = s ^ (1 << i)
                if weights[i] <= capacity:
                    dp[s] = max(dp[s], dp[prev_subset] + values[i])

    return dp[(1 << n) - 1]

# Example usage:
weights = list(map(int, input().split()))
values = list(map(int, input().split()))
capacity = int(input())
max_value = bit_dp(weights, values, capacity)
print(f"Maximum value using bit DP: {max_value}")
