require 'spec_helper'

describe BitmapEditor do
  let(:not_exist_file_path) { examples_file_path("a.txt") }
  let(:z_file_path) { examples_file_path("z.txt") }
  let(:s_file_path) { examples_file_path("s.txt") }
  let(:i_file_path) { examples_file_path("i.txt") }

  describe "#run" do
    context "when commands file does not exists" do
      it "returns incorrect output message if no file path is defined" do
        expect { subject.run(not_exist_file_path) }.to(
          output(/please provide correct file/).to_stdout
        )
      end
    end

    context "when commands file exists" do
      it "returns unrecognised output if file with an unknown command" do
        expect { subject.run(z_file_path) }.to(
          output(/unrecognised command :\(/).to_stdout
        )
      end

      it "returns empty image output if file with 'S' command without 'I'" do
        expect { subject.run(s_file_path) }.to(
          output("").to_stdout
        )
      end

      it "returns 6x5 image output if file with 'I 5 6' command" do
        expect { subject.run(i_file_path) }.to(
          output("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n").to_stdout
        )
      end
    end
  end
end