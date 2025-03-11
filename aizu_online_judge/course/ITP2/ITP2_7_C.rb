#!/usr/bin/env ruby

# ハッシュを使用してセットSを実装
s = {}

q = gets.to_i

q.times do
  query = gets.chomp.split.map(&:to_i)
  
  case query[0]
  when 0  # insert(x)
    x = query[1]
    s[x] = true  # 値をtrueにしてキーの存在を表す
    puts s.size
  
  when 1  # find(x)
    x = query[1]
    puts s.key?(x) ? 1 : 0
  
  when 2  # delete(x)
    x = query[1]
    s.delete(x)
  
  when 3  # dump(L, R)
    l = query[1]
    r = query[2]
    
    # L以上R以下の要素を昇順で出力
    s.keys.sort.each do |x|
      puts x if l <= x && x <= r
    end
  end
end
