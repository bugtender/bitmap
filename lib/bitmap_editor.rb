# frozen_string_literal: true

require "matrix"
require_relative "bitmap"

class BitmapEditor
  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)

    @bitmap = Bitmap.new
    File.open(file).each_line do |line|
      begin
        command, *args = line.chomp.split(" ")
        case command
        when "H"
          @bitmap.set_horizontal_segment(*args)
        when "V"
          @bitmap.set_vertical_segment(*args)
        when "C"
          @bitmap.clear
        when "L"
          @bitmap.colour_pixel(*args)
        when "I"
          @bitmap = Bitmap.new(args.first.to_i, args.last.to_i)
        when "S"
          puts @bitmap.print
        else
          puts "unrecognised command :("
        end
      rescue => exception
        puts exception
      end
    end
  end
end
