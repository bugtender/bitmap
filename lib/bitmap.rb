require "matrix"

class Bitmap
  attr_reader :rows, :columns

  def initialize(rows = 5, columns = 5)
    @rows = rows
    @columns = columns
    @pixels = Matrix.build(rows, columns){ "O" }.to_a
  end

  def print
    @pixels.map { |a| a.map { |i| i.to_s.rjust(1) }.join }
  end
end
