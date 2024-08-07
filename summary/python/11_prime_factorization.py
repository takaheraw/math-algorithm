def prime_factors(n):
    factors = []
    divisor = 2

    while n > 1:
        while n % divisor == 0:
            factors.append(divisor)
            n //= divisor
        divisor += 1

    return factors

# 入力を受け取る
n = int(input())

# 素因数分解を実行
result = prime_factors(n)

# 結果を出力
print(f"素因数分解結果: {result}")
