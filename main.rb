require_relative 'string_processor/parser.rb'

class Main
  def initialize(input)
    @parser = StringProcessor::Parser.new
    @extractor = StringProcessor::DelimiterExtractor.new(input)
  end

  def solve
    @extractor.extract_delimiter!
    nums = @parser.parse(@extractor.input, @extractor.delimiter)

    sum = nums.reduce(0) { |num, sum| sum + num }
    sum
    # nums = input.split(",")
    # nums = nums.map(&:to_i)
    # nums.reduce(0) { |sum, num| sum + num }
  end
end
