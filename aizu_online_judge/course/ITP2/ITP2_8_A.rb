# 入力を受け取る
q = gets.to_i

# 辞書を初期化
dictionary = {}

# クエリを処理
q.times do
  query = gets.chomp.split
  operation = query[0].to_i
  key = query[1]
  
  if operation == 0
    # insert操作
    value = query[2].to_i
    dictionary[key] = value
  elsif operation == 1
    # get操作
    puts dictionary[key]
  end
end
