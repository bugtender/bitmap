require 'spec_helper'

describe Bitmap do
  describe "#print" do
    it "returns an empty bitmap by default" do
      expect(Bitmap.new.print).to eq([])
    end

    it "returns an empty 6x5 bitmap" do
      expect(Bitmap.new(5, 6).print).to eq(["OOOOO", "OOOOO", "OOOOO", "OOOOO", "OOOOO", "OOOOO"])
    end
  end

  describe "#colour_pixel" do
    let(:bitmap){ Bitmap.new(5, 6) }
    it "returns an empty bitmap by default" do
      bitmap.colour_pixel(1, 3, "A")
      expect(bitmap.print).to eq(["OOOOO", "OOOOO", "AOOOO", "OOOOO", "OOOOO", "OOOOO"])
    end
  end
end