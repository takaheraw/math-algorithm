def check_numpoints(n, x, y, lx, rx, ly, ry)
  cnt = 0
  (0...n).each do |i|
    # 点 (x[i], y[i]) が長方形に含まれているかどうかを判定する
    cnt += 1 if lx <= x[i] && x[i] <= rx && ly <= y[i] && y[i] <= ry
  end
  cnt
end

# 入力
n, k = gets.chomp.split.map(&:to_i)
x = Array.new(n)
y = Array.new(n)
n.times do |i|
  x[i], y[i] = gets.chomp.split.map(&:to_i)
end

# 左端 x、右端 x、下端 y、上端 y を全探索（それぞれの番号が i, j, k, l）
answer = 10**19 # あり得ない値に設定
(0...n).each do |i|
  (0...n).each do |j|
    (0...n).each do |k|
      (0...n).each do |l|
        # cl <= x <= cr, dl <= y <= dr の長方形
        # 長方形を作るためには、cl < cr, dl < dr である必要がある
        cl = x[i]
        cr = x[j]
        dl = y[k]
        dr = y[l]
        next unless cl < cr && dl < dr

        if check_numpoints(n, x, y, cl, cr, dl, dr) >= k
          area = (cr - cl) * (dr - dl)
          answer = [answer, area].min
        end
      end
    end
  end
end

# 答えの出力
puts answer
