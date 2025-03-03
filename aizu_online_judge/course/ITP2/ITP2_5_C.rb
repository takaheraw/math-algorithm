def next_permutation(a)
  i = a.size - 2
  # Find the first index 'i' from the right such that a[i] < a[i+1]
  while i >= 0 && a[i] >= a[i+1]
    i -= 1
  end
  return false if i < 0  # a is the last permutation
  
  j = a.size - 1
  # Find the first index 'j' from the right such that a[j] > a[i]
  while a[j] <= a[i]
    j -= 1
  end
  a[i], a[j] = a[j], a[i]
  a[i+1..-1] = a[i+1..-1].reverse
  true
end

def prev_permutation(a)
  i = a.size - 2
  # Find the first index 'i' from the right such that a[i] > a[i+1]
  while i >= 0 && a[i] <= a[i+1]
    i -= 1
  end
  return false if i < 0  # a is the first permutation
  
  j = a.size - 1
  # Find the first index 'j' from the right such that a[j] < a[i]
  while a[j] >= a[i]
    j -= 1
  end
  a[i], a[j] = a[j], a[i]
  a[i+1..-1] = a[i+1..-1].reverse
  true
end

# 入力読み込み
n = gets.to_i
original = gets.split.map(&:to_i)

# 前の順列
prev = original.dup
prev_possible = prev_permutation(prev)

# 次の順列
nxt = original.dup
next_possible = next_permutation(nxt)

# 出力
puts prev_possible ? prev.join(" ") : ""
puts original.join(" ")
puts next_possible ? nxt.join(" ") : ""
