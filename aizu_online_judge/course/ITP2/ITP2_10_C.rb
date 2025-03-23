state = 0  # 初期状態はすべてのフラグがOFF (0)

q = gets.to_i  # クエリ数を取得

q.times do
  query = gets.chomp.split.map(&:to_i)
  operation = query[0]
  
  case operation
  when 0  # test(i)
    i = query[1]
    puts ((state >> i) & 1)
  when 1  # set(i)
    i = query[1]
    state |= (1 << i)
  when 2  # clear(i)
    i = query[1]
    state &= ~(1 << i)
  when 3  # flip(i)
    i = query[1]
    state ^= (1 << i)
  when 4  # all
    # 64ビットすべて1かどうかを確認
    all_ones = true
    64.times do |i|
      if ((state >> i) & 1) == 0
        all_ones = false
        break
      end
    end
    puts all_ones ? 1 : 0
  when 5  # any
    puts state != 0 ? 1 : 0
  when 6  # none
    puts state == 0 ? 1 : 0
  when 7  # count
    # ビット数をカウント
    count = 0
    64.times do |i|
      count += 1 if ((state >> i) & 1) == 1
    end
    puts count
  when 8  # val
    puts state
  end
end
