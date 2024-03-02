require_relative "../helper/constants.rb"
require_relative "../helper/common.rb"

module StringProcessor
  class DelimiterExtractor
    include Helper::Constants
    include Helper::Common

    attr_reader :delimiter, :input

    def initialize(input)
      self.delimiter = DEFAULT_DELIMITER
      self.input = input
    end

    def extract_delimiter!
      if self.input[0..1] == DELIM_IDENTIFIER
        delim, i = '', 2

        while !is_char_new_line?(self.input[i]) do
          ch = self.input[i]
          if ch != '[' && ch != ']'
            delim += self.input[i]
          end
          i += 1
        end

        self.delimiter = delim
        self.input = self.input[i+1..self.input.length]
      end

    end

    private

    attr_writer :delimiter, :input

  end
end
