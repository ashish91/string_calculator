require_relative "../helper/constants.rb"
require_relative "../helper/common.rb"
require_relative "../helper/trie.rb"

module StringProcessor
  class DelimiterExtractor
    include Helper::Constants
    include Helper::Common

    attr_reader :delimiters, :input, :delim_trie

    def initialize(input)
      self.delimiters = [DEFAULT_DELIMITER]

      self.delim_trie = Helper::Trie.new
      self.delim_trie.add(DEFAULT_DELIMITER)

      self.input = input
    end

    def extract_delimiters!
      if self.input[0..1] == DELIM_IDENTIFIER
        self.delim_trie = Helper::Trie.new
        delim, i = '', 2

        if self.input[i] == '['
          while !is_char_new_line?(self.input[i]) do
            ch = self.input[i]

            if ch == ']'
              self.delim_trie.add(delim)
              delim = ''
            elsif ch != '['
              delim += self.input[i]
            end
            i += 1
          end

          self.input = self.input[i+1..self.input.length]
        else
          self.delim_trie.add(self.input[i])
          self.input = self.input[i+2..self.input.length]
        end
      end

    end

    private

    attr_writer :delimiters, :input, :delim_trie

  end
end
