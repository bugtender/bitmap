require "matrix"
require_relative "bitmap"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)
    @bitmap = Bitmap.new
    File.open(file).each_line do |line|
      begin
        command, *args = line.chomp.split(" ")
        case command
        when "C"
          # Clears the table, setting all pixels to white (O).
          @bitmap.clear
        when "L"
          # Colours the pixel (X,Y) with colour C.
          @bitmap.colour_pixel(*args)
        when "I"
          # Create a new M x N image with all pixels coloured white (O).
          @bitmap = Bitmap.new(args.first.to_i, args.last.to_i)
        when "S"
          # Show the contents of the current image
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
