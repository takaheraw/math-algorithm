def solve_infection_simulation
  n = gets.to_i
  customers = []
  n.times do |i|
    l, r = gets.split.map(&:to_i)
    customers << [l, r, i + 1]  # [来店時刻, 退店時刻, 客番号]
  end
  
  q = gets.to_i
  q.times do
    p, x = gets.split.map(&:to_i)
    result = simulate_infection(customers, p, x)
    puts result
  end
end

def simulate_infection(customers, initial_infected, threshold)
  n = customers.length
  
  # イベントリスト作成：[時刻, タイプ, 客番号]
  # タイプ: 0=来店, 1=退店
  events = []
  customers.each do |l, r, customer_id|
    events << [l, 0, customer_id]  # 来店
    events << [r, 1, customer_id]  # 退店
  end
  
  # 時刻順にソート（同じ時刻なら来店を先に）
  events.sort! { |a, b| 
    if a[0] == b[0]
      a[1] <=> b[1]  # 来店(0)を退店(1)より先に
    else
      a[0] <=> b[0]
    end
  }
  
  # 状態管理
  infected = Array.new(n + 1, false)  # 感染状態
  infected[initial_infected] = true
  
  in_restaurant = Array.new(n + 1, false)  # 店内にいるかどうか
  exposure_time = Array.new(n + 1, 0)  # 累積接触時間
  last_time = 0  # 前回の時刻
  infected_count_in_restaurant = 0  # 店内の感染者数
  
  events.each do |time, event_type, customer_id|
    # 時間が進んだ場合、店内の非感染者の接触時間を更新
    if time > last_time && infected_count_in_restaurant > 0
      time_diff = time - last_time
      (1..n).each do |i|
        if in_restaurant[i] && !infected[i]
          exposure_time[i] += time_diff
          # 閾値に達したら感染
          if exposure_time[i] >= threshold
            infected[i] = true
            infected_count_in_restaurant += 1
          end
        end
      end
    end
    
    if event_type == 0  # 来店
      in_restaurant[customer_id] = true
      if infected[customer_id]
        infected_count_in_restaurant += 1
      end
    else  # 退店
      in_restaurant[customer_id] = false
      if infected[customer_id]
        infected_count_in_restaurant -= 1
      end
    end
    
    last_time = time
  end
  
  # 感染者数をカウント
  infected.count(true)
end

# メイン実行
solve_infection_simulation
