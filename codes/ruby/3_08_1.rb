# 入力
n, x = gets.chomp.split.map(&:to_i)
a = gets.chomp.split.map(&:to_i)

# 配列のソート
a.sort!

# 二分探索
answer = 'No'
left = 0
right = n - 1
while left <= right
  mid = (left + right) / 2
  if a[mid] == x
    answer = 'Yes'
    break
  elsif a[mid] > x
    # 探索範囲を前半部分に絞る
    right = mid - 1
  elsif a[mid] < x
    # 探索範囲を後半部分に絞る
    left = mid + 1
  end
end

# 答えの出力
puts answer
