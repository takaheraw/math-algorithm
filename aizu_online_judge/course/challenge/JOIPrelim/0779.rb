def solve_highway_tolls
  n, m, k = gets.split.map(&:to_i)
  
  edges = []
  m.times do
    a, b, l, c = gets.split.map(&:to_i)
    edges << [a, b, l, c]
  end
  
  graph = Array.new(n + 1) { [] }
  edges.each do |a, b, l, c|
    graph[a] << [b, l, c]
  end
  
  reachable = Array.new(n + 1, false)
  queue = [1]
  reachable[1] = true
  
  while !queue.empty?
    current = queue.shift
    graph[current].each do |next_city, _, _|
      unless reachable[next_city]
        reachable[next_city] = true
        queue << next_city
      end
    end
  end
  
  unless reachable[n]
    puts -1
    return
  end
  
  if k == 0
    dist = Array.new(n + 1, Float::INFINITY)
    dist[1] = 0
    
    (n - 1).times do
      edges.each do |a, b, l, c|
        if dist[a] != Float::INFINITY
          dist[b] = [dist[b], dist[a] + c].min
        end
      end
    end
    
    puts dist[n] == Float::INFINITY ? -1 : dist[n]
    return
  end
  
  inf = 10**15
  
  time_dist = Array.new(n + 1, inf)
  time_dist[1] = 0
  
  queue = [1]
  in_queue = Array.new(n + 1, false)
  in_queue[1] = true
  
  while !queue.empty?
    u = queue.shift
    in_queue[u] = false
    
    graph[u].each do |v, l, c|
      if time_dist[u] + l < time_dist[v]
        time_dist[v] = time_dist[u] + l
        if !in_queue[v]
          queue << v
          in_queue[v] = true
        end
      end
    end
  end
  
  max_time = time_dist[n]
  if max_time >= inf
    puts -1
    return
  end
  
  time_limit = [(max_time * 1.5).to_i, 3000].min
  
  dist = Array.new(n + 1) { Array.new(2 * time_limit + 1, inf) }
  
  (-time_limit..time_limit).each do |t|
    dist[1][t + time_limit] = 0
  end
  
  queue = []
  in_queue_state = Set.new
  
  (-time_limit..time_limit).each do |t|
    state = [1, t]
    queue << state
    in_queue_state.add(state)
  end
  
  while !queue.empty?
    city, time = queue.shift
    in_queue_state.delete([city, time])
    
    time_idx = time + time_limit
    current_cost = dist[city][time_idx]
    
    graph[city].each do |next_city, length, base_cost|
      arrival_time = time + length
      next if arrival_time.abs > time_limit
      
      arrival_idx = arrival_time + time_limit
      toll = base_cost + k * time.abs
      new_cost = current_cost + toll
      
      if new_cost < dist[next_city][arrival_idx]
        dist[next_city][arrival_idx] = new_cost
        
        state = [next_city, arrival_time]
        unless in_queue_state.include?(state)
          queue << state
          in_queue_state.add(state)
        end
      end
    end
  end
  
  min_cost = inf
  (-time_limit..time_limit).each do |t|
    cost = dist[n][t + time_limit]
    min_cost = [min_cost, cost].min if cost < inf
  end
  
  if min_cost >= inf
    puts -1
  else
    puts min_cost
  end
end

solve_highway_tolls
