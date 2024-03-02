require_relative "../helper/constants.rb"

module StringProcessor
  class DelimiterExtractor
    attr_reader :delimiter, :input

    def initialize(input)
      self.delimiter = Helper::Constants::DEFAULT_DELIMITER
      self.input = input
    end

    def extract_delimiter!
      if self.input[0..1] == Helper::Constants::DELIM_IDENTIFIER
        delim, i = '', 2

        while !encountered_space(self.input, i) do
          delim += self.input[i]
          i += 1
        end

        self.delimiter = delim
        self.input = self.input[i+1..self.input.length]
      end

    end

    def encountered_space(str, i)
      return (str[i] == Helper::Constants::NEW_LINE || str[i] == Helper::Constants::WINDOWS_NEW_LINE)
    end

    private

    attr_writer :delimiter, :input

  end
end
