# 入力の読み込み
H, W = gets.split.map(&:to_i)
region = Array.new(H) { gets.chomp }
R, C = gets.split.map(&:to_i)
pattern = Array.new(R) { gets.chomp }

# パターンが存在する可能性のある全ての左上座標について調べる
(0..H - R).each do |i|
  (0..W - C).each do |j|
    match = true
    # パターンの各行を領域中の該当部分と比較
    (0...R).each do |r|
      if region[i + r][j, C] != pattern[r]
        match = false
        break
      end
    end
    # パターンが見つかったら座標を出力
    puts "#{i} #{j}" if match
  end
end
