require "spec_helper"

describe Encryption do
  subject { Encryption.new("./spec/enigma/test_files/test_encrypt.txt",
    "./spec/enigma/test_files/test.txt") }

  before :each do
    allow(subject).to receive(:generate_key) { "51569" }
  end

  describe "#new" do
    it "should create a new instance" do
      expect(subject).to be_an_instance_of Encryption
    end
  end

  describe "#encrypt" do
    it "should return a different text each time" do
      expect(subject.encrypt("hello world")).not_to eql "hello world"
    end
  end

  describe "key" do
    it "has a key" do
      expect(subject.generate_key).to eql "51569"
    end

    it "generate a new key on each instance" do
      key_test = Encryption.new("test_encrypt.txt", "test_encrypt.txt")
      expect(subject.key).not_to eql key_test.key
    end
  end

  describe "#total_rotation" do
    it "should add A rotation of key to A rotation of Date offset" do
      expect(subject.total_rotation(1, "51569", 270_216)).to eql 15
    end

    it "should add B rotation of key to B rotation of Date offset" do
      expect(subject.total_rotation(2, "51569", 270_216)).to eql 56
    end

    it "should add C rotation of key to C rotation of Date offset" do
      expect(subject.total_rotation(3, "51569", 270_216)).to eql 70
    end

    it "should add D rotation of key to D rotation of Date offset" do
      expect(subject.total_rotation(4, "51569", 270_216)).to eql 51
    end
  end

  describe "#key_rotation" do
    it "it can return correct A rotation" do
      expect(subject.key_rotation(0, "51569")).to eql 51
    end
    it "it can return correct B rotation" do
      expect(subject.key_rotation(1, "51569")).to eql 15
    end
    it "it can return correct A rotation" do
      expect(subject.key_rotation(2, "51569")).to eql 56
    end
    it "it can return correct A rotation" do
      expect(subject.key_rotation(3, "51569")).to eql 69
    end
  end
  describe "#offset_rotation" do
    it "it can return correct A offset" do
      expect(subject.offset_rotation(0, "9609")).to eql 9
    end
    it "it can return correct B offset" do
      expect(subject.offset_rotation(1, "9609")).to eql 6
    end
    it "it can return correct A offset" do
      expect(subject.offset_rotation(2, "9609")).to eql 0
    end
    it "it can return correct A offset" do
      expect(subject.offset_rotation(3, "9609")).to eql 9
    end
  end

  describe "#date_offset" do
    it "return encryption format date" do
      expect(subject.offset_key(240_216)).to eql "6656"
    end
  end

  describe "#date_of_encryption" do
    today = Time.now
    it "should return the current date in the correct format" do
      def zero_pad(month)
        month < 10 ? "0" << month.to_s : month
      end

      today = "#{zero_pad(today.day)}#{zero_pad(today.month)}#{today.year.to_s[-2..-1]}"

      expect(subject.date_of_encryption).to eql today
    end
  end

  describe "#format_month" do
    it "should pad zero to month if it is less than 10" do
      expect(subject.format_month(2)).to eql "02"
      expect(subject.format_month(9)).to eql "09"
      expect(subject.format_month(10)).to eql 10
      expect(subject.format_month(12)).to eql 12
    end
  end

  describe "#file_to_encrypt" do
    it { expect(subject.file_to_encrypt).to be_a String }
  end

  describe "#encrypt_write" do
    it "it should confirm that a text was written to file" do
      expect(subject.encrypt_write).to eql 20
    end
  end
end
