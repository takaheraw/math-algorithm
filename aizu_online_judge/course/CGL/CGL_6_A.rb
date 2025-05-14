#!/usr/bin/env ruby

# 線分を表すクラス
class Segment
  attr_reader :x1, :y1, :x2, :y2, :is_horizontal

  def initialize(x1, y1, x2, y2)
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
    
    # 水平線分か垂直線分かを判断
    @is_horizontal = (y1 == y2)
    
    # 始点と終点を整理（x1 ≤ x2, y1 ≤ y2 となるようにする）
    if @is_horizontal && @x1 > @x2
      @x1, @x2 = @x2, @x1
    elsif !@is_horizontal && @y1 > @y2
      @y1, @y2 = @y2, @y1
    end
  end

  # 別の線分と交差するかどうかを判断
  def intersects?(other)
    # 同じ方向の線分（水平同士または垂直同士）は交差しない
    return false if @is_horizontal == other.is_horizontal

    if @is_horizontal
      # self: 水平線分, other: 垂直線分
      horizontal = self
      vertical = other
    else
      # self: 垂直線分, other: 水平線分 
      horizontal = other
      vertical = self
    end

    # 交差判定
    # 水平線分のX範囲内に垂直線分のXが含まれ、
    # かつ垂直線分のY範囲内に水平線分のYが含まれるかを確認
    (horizontal.x1 <= vertical.x1 && vertical.x1 <= horizontal.x2) &&
    (vertical.y1 <= horizontal.y1 && horizontal.y1 <= vertical.y2)
  end
end

# 入力読み込み
n = gets.to_i
segments = []

n.times do
  x1, y1, x2, y2 = gets.split.map(&:to_i)
  segments << Segment.new(x1, y1, x2, y2)
end

# 交差点数を数える
intersections = 0

# 全ての線分のペアについて交差判定
(0...segments.size).each do |i|
  ((i+1)...segments.size).each do |j|
    intersections += 1 if segments[i].intersects?(segments[j])
  end
end

# 結果出力
puts intersections
