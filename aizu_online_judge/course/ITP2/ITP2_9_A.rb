n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)

i, j = 0, 0
result = []

# 両方の配列を順番に見て、小さい順に要素を追加
while i < n && j < m
  if a[i] < b[j]
    result << a[i]
    i += 1
  elsif a[i] > b[j]
    result << b[j]
    j += 1
  else
    result << a[i]  # a[i] と b[j]が同じ場合は一回だけ追加
    i += 1
    j += 1
  end
end

# 残った要素を追加（どちらかが先に尽きるので）
result.concat(a[i..]) if i < n
result.concat(b[j..]) if j < m

# 結果を一行ずつ表示
puts result
