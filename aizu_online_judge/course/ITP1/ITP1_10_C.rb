def standard_deviation
  loop do
    # 学生の数 n を取得
    n = gets.to_i
    break if n == 0 # n が 0 の場合は終了

    # スコアを取得
    scores = gets.split.map(&:to_f)

    # 平均値 m を計算
    m = scores.sum / n

    # 分散 α^2 を計算
    variance = scores.sum { |s| (s - m)**2 } / n

    # 標準偏差 √α^2 を計算
    stddev = Math.sqrt(variance)

    # 結果を小数点以下8桁で出力
    puts format("%.8f", stddev)
  end
end

standard_deviation
