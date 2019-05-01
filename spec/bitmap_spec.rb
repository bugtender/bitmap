require 'spec_helper'

describe Bitmap do
  subject { Bitmap.new }
  describe "#print" do
    it "returns an empty 5x5 bitmap by default" do
      expect(subject.print).to eq(["OOOOO", "OOOOO", "OOOOO", "OOOOO", "OOOOO"])
    end
  end
end