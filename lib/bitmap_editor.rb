require "matrix"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when "S"
        # Show the contents of the current image
        puts bitmap_print
      else
        puts "unrecognised command :("
      end
    end
  end

  private

  def bitmap_print(rows = 5, columns = 5)
    pixels = Matrix.build(rows, columns){ "O" }.to_a
    pixels.map { |a| a.map { |i| i.to_s.rjust(1) }.join }
  end
end
