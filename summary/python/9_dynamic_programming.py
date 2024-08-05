# 部屋の数
room_count = 5

# パターン1とパターン2の料金
pattern1 = [2, 4, 1, 3]
pattern2 = [5, 3, 7]

# DPテーブルの初期化
dp = [0] * (room_count + 1)

# 初期値の設定
dp[1] = 0
dp[2] = pattern1[0]

# 動的計画法による最小コストの計算
for i in range(3, room_count + 1):
    dp[i] = min(dp[i-1] + pattern1[i-2], dp[i-2] + pattern2[i-3])

# 結果の出力
print(dp[room_count])
