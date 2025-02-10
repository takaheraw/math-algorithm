def round_robin_scheduler
  # 標準入力の最初の1行を取得
  n, q = gets.split.map(&:to_i)

  # 残りの入力を取得
  processes = []
  n.times do
    name, time = gets.split
    processes << [name, time.to_i]
  end

  # 現在の時刻
  current_time = 0

  # 結果格納用
  result = []

  # キューでラウンドロビン処理をシミュレート
  while !processes.empty?
    name, time = processes.shift

    if time <= q
      # 処理がクオンタム内に終了する場合
      current_time += time
      result << [name, current_time]
    else
      # 処理がクオンタム内に終了しない場合
      current_time += q
      processes.push([name, time - q])
    end
  end

  # 結果を出力
  result.each { |name, finish_time| puts "#{name} #{finish_time}" }
end

# メソッドを実行
round_robin_scheduler
