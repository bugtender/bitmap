# frozen_string_literal: true

require "matrix"

class Bitmap
  class InvalidRangeError < StandardError; end

  attr_reader :rows, :columns, :pixels

  def initialize(columns = 0, rows = 0)
    @rows = rows
    @columns = columns
    validate_rows_and_columns
    @pixels = Matrix.build(rows, columns) { "O" }.to_a
  end

  def print
    @pixels.map { |a| a.map { |i| i.to_s.rjust(1) }.join }
  end

  def colour_pixel(x, y, colour)
    @pixels[y.to_i-1][x.to_i-1] = colour
  end

  def clear
    @pixels = Matrix.build(@rows, @columns){ "O" }.to_a
  end

  def set_vertical_segment(x, y1, y2, colour)
    (y1.to_i..y2.to_i).each do |y|
      @pixels[y - 1][x.to_i - 1] = colour
    end
  end

  def set_horizontal_segment(x1, x2, y, colour)
    (x1.to_i..x2.to_i).each do |x|
      @pixels[y.to_i - 1][x - 1] = colour
    end
  end

  private

  def validate_rows_and_columns
    raise InvalidRangeError, "Invalid columns number [1~250]." if @columns > 250 || @columns < 1
    raise InvalidRangeError, "Invalid Rows number [1~250]." if @rows > 250 || @rows < 1
  end
end
