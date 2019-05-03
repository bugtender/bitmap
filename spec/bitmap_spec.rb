# frozen_string_literal: true

require "spec_helper"

describe Bitmap do
  let(:bitmap) { Bitmap.new(5, 6) }

  describe ".new" do
    it "create a bitmap with exactly row & columns" do
      expect(bitmap.columns).to eq 5
      expect(bitmap.rows).to eq 6
      expect(bitmap.pixels).to eq(
        [%w[O O O O O], %w[O O O O O], %w[O O O O O],
         %w[O O O O O], %w[O O O O O], %w[O O O O O],]
      )
    end

    it "create a bitmap with row & columns between 1~250" do
      expect { Bitmap.new(251, 1) }.to raise_error(Bitmap::InvalidRangeError)
      expect { Bitmap.new(1, 251) }.to raise_error(Bitmap::InvalidRangeError)
      expect { Bitmap.new(251, 251) }.to raise_error(Bitmap::InvalidRangeError)
      expect { Bitmap.new(0, 0) }.to raise_error(Bitmap::InvalidRangeError)
    end
  end

  describe "#print" do
    it "returns an empty 6x5 bitmap" do
      expect(bitmap.print).to eq %w[OOOOO OOOOO OOOOO OOOOO OOOOO OOOOO]
    end
  end

  describe "#colour_pixel" do
    it "returns an bitmap with colour 'A' on [1, 3] position" do
      bitmap.colour_pixel(1, 3, "A")
      expect(bitmap.print).to eq %w[OOOOO OOOOO AOOOO OOOOO OOOOO OOOOO]
    end
  end

  describe "#clear" do
    let(:bitmap) { Bitmap.new(5, 6) }
    it "returns an empty bitmap after clear" do
      bitmap.colour_pixel(2, 4, "A")
      expect(bitmap.print).to eq %w[OOOOO OOOOO OOOOO OAOOO OOOOO OOOOO]
      bitmap.clear
      expect(bitmap.print).to eq %w[OOOOO OOOOO OOOOO OOOOO OOOOO OOOOO]
    end
  end

  describe "#set_vertical_segment" do
    let(:bitmap) { Bitmap.new(5, 6) }
    it "returns an bitmap with a vertical segment" do
      bitmap.set_vertical_segment(2, 3, 6, "W")
      expect(bitmap.print).to eq %w[OOOOO OOOOO OWOOO OWOOO OWOOO OWOOO]
    end
  end

  describe "#set_horizontal_segment" do
    let(:bitmap) { Bitmap.new(5, 6) }
    it "returns an empty bitmap after clear" do
      bitmap.set_horizontal_segment(3, 5, 2, "Z")
      expect(bitmap.print).to eq %w[OOOOO OOZZZ OOOOO OOOOO OOOOO OOOOO]
    end
  end
end
