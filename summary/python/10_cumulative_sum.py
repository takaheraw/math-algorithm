# 来場者数のリスト
visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39]

# 累積和のリストを初期化
accumulates = [0] * (len(visitors) + 1)

# 累積和を計算
for i in range(1, len(visitors) + 1):
    accumulates[i] = accumulates[i - 1] + visitors[i - 1]

# 特定の期間の来場者数を計算する関数
def get_visitors(start, end):
    return accumulates[end] - accumulates[start - 1]

# テスト
targets = [(2, 4), (4, 13)]
for start, end in targets:
    print(f"{start}日目から{end}日目までの来場者数: {get_visitors(start, end)}")
