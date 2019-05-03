# frozen_string_literal: true

require "matrix"

class Bitmap
  MAX_ROWS = MAX_COLUMNS = 250
  MIN_ROWS = MIN_COLUMNS = 1

  class InvalidRangeError < StandardError; end
  class InvalidCoordinatesError < StandardError; end
  attr_reader :rows, :columns, :pixels

  def initialize(columns, rows)
    @columns, @rows = coordinates(columns, rows)
    validate_rows_and_columns
    create_pixels
  end

  def print
    @pixels.map { |a| a.map { |i| i.to_s.rjust(1) }.join }
  end

  def clear
    create_pixels
  end

  def colour_pixel(x, y, colour)
    x, y = coordinates(x, y)
    raise InvalidCoordinatesError unless valid_coordinates?(x, y)

    @pixels[y - 1][x - 1] = colour
  end

  def set_vertical_segment(x, y1, y2, colour)
    x, y1, y2 = coordinates(x, y1, y2)
    raise InvalidCoordinatesError unless valid_vertical_coordinates?(x, y1, y2)

    (y1..y2).each { |y| @pixels[y - 1][x - 1] = colour }
  end

  def set_horizontal_segment(x1, x2, y, colour)
    x1, x2, y = coordinates(x1, x2, y)
    raise InvalidCoordinatesError unless valid_horizontal_coordinates?(x1, x2, y)

    (x1..x2).each { |x| @pixels[y - 1][x - 1] = colour }
  end

  private

  def create_pixels
    @pixels = Matrix.build(rows, columns) { "O" }.to_a
  end

  def validate_rows_and_columns
    raise InvalidRangeError, "Invalid Rows or Column number [1~250]." unless valid_dimensions?
  end

  def valid_dimensions?
    columns >= MIN_COLUMNS && columns <= MAX_COLUMNS &&
      rows >= MIN_ROWS && rows <= MAX_ROWS
  end

  def coordinates(*value)
    value.map(&:to_i)
  end

  def valid_coordinates?(x, y)
    x.between?(1, columns) && y.between?(1, rows)
  end

  def valid_vertical_coordinates?(x, y1, y2)
    x.between?(1, columns) && y1.between?(1, rows) && y2.between?(1, rows)
  end

  def valid_horizontal_coordinates?(x1, x2, y)
    x1.between?(1, columns) && x2.between?(1, columns) && y.between?(1, rows)
  end
end
