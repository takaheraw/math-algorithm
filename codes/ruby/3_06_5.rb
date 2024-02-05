def solve(l, r, a)
  return a[l] if r - l == 1

  m = (l + r) / 2  # 区間 [l, r) の中央で分割する
  s1 = solve(l, m, a)  # s1 は a[l] + ... + a[m-1] の合計値となる
  s2 = solve(m, r, a)  # s2 は a[m] + ... + a[r-1] の合計値となる
  s1 + s2
end

# 入力
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 再帰呼び出し → 答えの出力
answer = solve(0, n, a)
puts answer
