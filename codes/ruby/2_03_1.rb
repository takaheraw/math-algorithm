$cnt = 1000

def func1
  2021
end

def func2(pos)
  $cnt += 1
  $cnt + pos
end

puts func1 # 「2021」と出力
puts func2(500) # 「1501」と出力
puts func2(500) # 「1502」と出力
