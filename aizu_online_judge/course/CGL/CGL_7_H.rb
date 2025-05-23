#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

Point = Struct.new(:x, :y) do
  def norm2
    x*x + y*y
  end
end

# 定数
EPS = 1e-8

# ベクトルの外積
def cross(a, b)
  a.x * b.y - a.y * b.x
end

# ベクトルの内積
def dot(a, b)
  a.x * b.x + a.y * b.y
end

# 2つのベクトル a→b 間の符号付き角 (radian)
def signed_angle(a, b)
  Math.atan2(cross(a, b), dot(a, b))
end

# 原点−p−q で囲まれる三角形と円の交差面積を計算
def triangle_circle_area(p, q, r)
  r2 = r * r
  rp2 = p.x*p.x + p.y*p.y
  rq2 = q.x*q.x + q.y*q.y

  # 両端が円内（かつ円周上）の場合は三角形面積
  if rp2 <= r2 + EPS && rq2 <= r2 + EPS
    return cross(p, q) / 2.0
  end

  # 線分 p→q と円の交点パラメータ t を求める
  d = Point.new(q.x - p.x, q.y - p.y)
  a = dot(d, d)
  b = 2 * dot(p, d)
  c = p.x*p.x + p.y*p.y - r2
  disc = b*b - 4*a*c

  ts = [0.0, 1.0]
  if disc > 0
    sd = Math.sqrt(disc)
    t1 = (-b - sd) / (2*a)
    t2 = (-b + sd) / (2*a)
    ts << t1 if t1.between?(0.0, 1.0)
    ts << t2 if t2.between?(0.0, 1.0)
  end
  ts = ts.sort.uniq

  area = 0.0
  ts.each_cons(2) do |ta, tb|
    pa = Point.new(p.x + d.x * ta, p.y + d.y * ta)
    pb = Point.new(p.x + d.x * tb, p.y + d.y * tb)
    pa2 = pa.x*pa.x + pa.y*pa.y
    pb2 = pb.x*pb.x + pb.y*pb.y

    if pa2 <= r2 + EPS && pb2 <= r2 + EPS
      # 小線分まるごと円内 → 三角形
      area += cross(pa, pb) / 2.0
    else
      # それ以外（扇形に相当）
      theta = signed_angle(pa, pb)
      area += 0.5 * r2 * theta
    end
  end

  area
end

# --- 入出力処理 ---
n, r = gets.split.map(&:to_f)
points = n.to_i.times.map do
  x, y = gets.split.map(&:to_f)
  Point.new(x, y)
end

total_area = 0.0
points.each_with_index do |p, i|
  q = points[(i+1) % n]
  total_area += triangle_circle_area(p, q, r)
end

# 多角形はCCW順なので正の値になるはず
puts sprintf("%.10f", total_area.abs)
