require 'rspec'
require_relative '../main.rb'

RSpec.describe do
  subject { Main.new }

  context "Adds numbers with comma" do
    it "when the input is empty" do
      expect(Main.new("").solve).to eq(0)
    end

    it "when there is only one number" do
      expect(Main.new("1").solve).to eq(1)
    end

    it "when there are 2 numbers" do
      expect(Main.new("1,5").solve).to eq(6)
    end

    it "when there are multiple numbers" do
      expect(Main.new("1,5,4,5").solve).to eq(15)
    end

    it "when there are more than one digit numbers" do
      expect(Main.new("11,50,43,57").solve).to eq(161)
    end
  end

  context "Adds numbers with new line" do
    it "when there is a new line" do
      expect(Main.new("1\n2,3").solve).to eq(6)
    end

    it "when there is multiple new lines" do
      expect(Main.new("11,50\n,43\n,57").solve).to eq(161)
    end
  end

  context "Adds numbers with custom delimiter" do
    it "when there is a custom delimiter with multiple numbers" do
      expect(Main.new("//;\n1;2;3").solve).to eq(6)
    end

    it "when there is a custom delimiter with single number" do
      expect(Main.new("//;\n1").solve).to eq(1)
    end
  end

  context "Throws exception for invalid cases" do
    it "when there is a new line after comma" do
      expect { Main.new("1,\n").solve }.to raise_error(Exception)
    end

    it "when there is a new line after comma" do
      expect { Main.new("1,\n2").solve }.to raise_error(Exception)
    end

    it "when there are negative numbers" do
      expect{ Main.new("-1,2,3").solve }.to raise_error(Exception)
    end
  end

end
