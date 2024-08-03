def gcd(a, b):
    while a >= 1 and b >= 1:
        if a >= b:
            a = a % b
        else:
            b = b % a
    return a if a >= 1 else b

# 入力を受け取る
a, b = map(int, input().split())

# 最大公約数を計算して出力
result = gcd(a, b)
print(f"{result}")
