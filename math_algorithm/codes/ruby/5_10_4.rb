# 入力
n = gets.to_i
s = gets.chomp

# '(' の数 - ')' の数を depth とする
# 途中で depth が負になったら、この時点で No
depth = 0
flag = true
n.times do |i|
  if s[i] == '('
    depth += 1
  elsif s[i] == ')'
    depth -= 1
  end
  flag = false if depth < 0
end

# 最後、depth = 0 ['(' と ')' の数が同じ] であるかも追加で判定する
if flag == true && depth == 0
  puts 'Yes'
else
  puts 'No'
end
