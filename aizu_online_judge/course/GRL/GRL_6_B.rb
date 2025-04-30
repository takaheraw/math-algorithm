#!/usr/bin/env ruby
# frozen_string_literal: true

Edge = Struct.new(:to, :rev, :cap, :cost)

class MinCostFlow
  def initialize(n)
    @g = Array.new(n) { [] }
  end

  def add_edge(from, to, cap, cost)
    fwd = Edge.new(to,   @g[to].size, cap,  cost)
    rev = Edge.new(from, @g[from].size, 0, -cost)
    @g[from] << fwd
    @g[to]   << rev
  end

  # 0:source, n-1:sink
  def min_cost_flow(src, sink, flow)
    return 0 if flow.zero?

    n          = @g.size
    h          = Array.new(n, 0)           # potentials
    total_cost = 0

    while flow.positive?
      dist, pv, pe = dijkstra(src, h)
      return -1 if dist[sink] == Float::INFINITY

      n.times { |v| h[v] += dist[v] if dist[v] < Float::INFINITY }

      addable = flow
      v = sink
      until v == src
        u      = pv[v]
        e      = @g[u][pe[v]]
        addable = [addable, e.cap].min
        v = u
      end

      v = sink
      until v == src
        u      = pv[v]
        e      = @g[u][pe[v]]
        e.cap -= addable
        @g[e.to][e.rev].cap += addable
        v = u
      end

      total_cost += addable * h[sink]
      flow       -= addable
    end
    total_cost
  end

  private

  def dijkstra(src, h)
    n     = @g.size
    dist  = Array.new(n, Float::INFINITY)
    pv    = Array.new(n)
    pe    = Array.new(n)
    dist[src] = 0
    pq = [[0, src]]

    until pq.empty?
      pq.sort_by!(&:first)    # 最短距離順に並べ替え
      cost_u, u = pq.shift    # 一番近い頂点を pop
      next if cost_u > dist[u]

      @g[u].each_with_index do |e, idx|
        next if e.cap.zero?
        v        = e.to
        new_dist = dist[u] + e.cost + h[u] - h[v]
        next unless new_dist < dist[v]

        dist[v] = new_dist
        pv[v]   = u
        pe[v]   = idx
        pq << [dist[v], v]
      end
    end
    [dist, pv, pe]
  end
end

# ----------------- main -----------------
v_cnt, e_cnt, need = STDIN.readline.split.map(&:to_i)
mcf = MinCostFlow.new(v_cnt)
e_cnt.times do
  from, to, cap, cost = STDIN.readline.split.map(&:to_i)
  mcf.add_edge(from, to, cap, cost)
end
puts mcf.min_cost_flow(0, v_cnt - 1, need)
