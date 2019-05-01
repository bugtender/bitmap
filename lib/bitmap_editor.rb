require "matrix"
require_relative "bitmap"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      @bitmap = Bitmap.new
      case line
      when "S"
        # Show the contents of the current image
        puts @bitmap.print
      else
        puts "unrecognised command :("
      end
    end
  end
end
