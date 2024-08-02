def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

# 入力を受け取る
numbers = list(map(int, input().split()))

# 各数字について素数判定を行う
for num in numbers:
    if is_prime(num):
        print(f"{num} は素数です。")
    else:
        print(f"{num} は素数ではありません。")
