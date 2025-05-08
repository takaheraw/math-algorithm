#!/usr/bin/env ruby

# 点を表すクラス
class Point
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x.to_f
    @y = y.to_f
  end
  
  # 2点間の距離を計算
  def distance_to(other)
    Math.sqrt((@x - other.x)**2 + (@y - other.y)**2)
  end
  
  # ベクトルの加算
  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end
  
  # ベクトルの減算
  def -(other)
    Point.new(@x - other.x, @y - other.y)
  end
  
  # スカラー倍
  def *(scalar)
    Point.new(@x * scalar, @y * scalar)
  end
  
  # 内積
  def dot(other)
    @x * other.x + @y * other.y
  end
  
  # ノルム（長さ）の二乗
  def norm_squared
    @x * @x + @y * @y
  end
  
  # ノルム（長さ）
  def norm
    Math.sqrt(norm_squared)
  end
end

# 線分を表すクラス
class Segment
  attr_accessor :p1, :p2
  
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end
  
  # 線分の方向ベクトル
  def direction
    @p2 - @p1
  end
  
  # 点と線分の最短距離
  def distance_to_point(p)
    d = direction
    len_squared = d.norm_squared
    
    # 線分の長さが0の場合（つまり点になる場合）
    if len_squared.zero?
      return @p1.distance_to(p)
    end
    
    # 射影の係数を計算 (t = ((p - p1) ・ d) / |d|^2)
    t = (p - @p1).dot(d) / len_squared
    
    if t < 0
      # 射影が線分の外側（p1側）にある場合
      @p1.distance_to(p)
    elsif t > 1
      # 射影が線分の外側（p2側）にある場合
      @p2.distance_to(p)
    else
      # 射影が線分上にある場合
      proj = @p1 + d * t
      p.distance_to(proj)
    end
  end
  
  # 線分と線分の最短距離
  def distance_to_segment(other)
    # 線分同士が交差している場合
    if segments_intersect?(self, other)
      return 0.0
    end
    
    # 以下の4つの距離の最小値を計算
    # 1. self の p1 から other への最短距離
    # 2. self の p2 から other への最短距離
    # 3. other の p1 から self への最短距離
    # 4. other の p2 から self への最短距離
    [
      other.distance_to_point(@p1),
      other.distance_to_point(@p2),
      distance_to_point(other.p1),
      distance_to_point(other.p2)
    ].min
  end
end

# 線分の交差判定
def segments_intersect?(s1, s2)
  p0, p1 = s1.p1, s1.p2
  p2, p3 = s2.p1, s2.p2
  
  # 外積による方向判定
  def cross(v1, v2)
    v1.x * v2.y - v1.y * v2.x
  end
  
  # 線分1から見た線分2の両端の方向
  d1 = cross(p1 - p0, p2 - p0)
  d2 = cross(p1 - p0, p3 - p0)
  
  # 線分2から見た線分1の両端の方向
  d3 = cross(p3 - p2, p0 - p2)
  d4 = cross(p3 - p2, p1 - p2)
  
  # 符号が異なる（交差の可能性がある）
  if (d1 * d2 <= 0) && (d3 * d4 <= 0)
    # 三点が一直線上にある特殊なケースを処理
    if d1.zero? && d2.zero? && d3.zero? && d4.zero?
      # 線分の重なりをチェック
      v1 = p1 - p0
      v2 = p2 - p0
      v3 = p3 - p0
      
      # 内積で投影を計算
      t0_2 = v1.dot(v2) / v1.norm_squared
      t0_3 = v1.dot(v3) / v1.norm_squared
      
      # 区間 [0,1] と [t0_2, t0_3] の重なりをチェック
      return [0, [t0_2, t0_3].min].max <= [1, [t0_2, t0_3].max].min
    end
    return true
  end
  
  false
end

# メイン処理
q = gets.chomp.to_i

q.times do
  xp0, yp0, xp1, yp1, xp2, yp2, xp3, yp3 = gets.chomp.split.map(&:to_i)
  
  p0 = Point.new(xp0, yp0)
  p1 = Point.new(xp1, yp1)
  p2 = Point.new(xp2, yp2)
  p3 = Point.new(xp3, yp3)
  
  s1 = Segment.new(p0, p1)
  s2 = Segment.new(p2, p3)
  
  distance = s1.distance_to_segment(s2)
  puts format("%.10f", distance)
end
