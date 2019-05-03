# frozen_string_literal: true

require "matrix"
require_relative "bitmap"

class BitmapEditor
  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)

    File.open(file).each_line do |line|
      begin
        _command, *args = line.chomp.split(" ")
        case line
        when /I (\d+) (\d+)/i
          @bitmap = Bitmap.new(*args)
        when /L (\d+) (\d+) ([A-Z])/i
          @bitmap.colour_pixel(*args)
        when /H (\d+) (\d+) (\d+) ([A-Z])/i
          @bitmap.set_horizontal_segment(*args)
        when /V (\d+) (\d+) (\d+) ([A-Z])/i
          @bitmap.set_vertical_segment(*args)
        when /C/i
          @bitmap.clear
        when /S/i
          print_bitmap
        else
          puts "unrecognised command :("
        end
      rescue => exception
        puts exception
      end
    end
  end

  private

  def print_bitmap
    return puts "Can't print bitmap without initialize it" unless @bitmap

    puts @bitmap.print
  end
end
