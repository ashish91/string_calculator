require_relative 'delimiter_extractor.rb'
require_relative "../helper/constants.rb"
require_relative "../helper/trie.rb"

require_relative "../exceptions/invalid_new_line_exception.rb"
require_relative "../exceptions/negative_number_exception.rb"

module StringProcessor
  class Parser
    include Helper::Constants
    include Helper::Common

    def parse(delim_extractor)
      simpler_str = ''
      i = 0

      while i < delim_extractor.input.length
        delim_chars = delim_extractor.delim_trie.nearest_match(delim_extractor.input[i..])
        if delim_chars > 0
          i += delim_chars
          simpler_str += ','
        end
        simpler_str += delim_extractor.input[i]

        i += 1
      end

      arr = simpler_str.split(',')

      nums = []
      arr.each do |val|

        # TODO
        # if /^([0-9]+\n[0-9]*)+$/.match(val)
        #   nums += val.split(/\n/)[0]
        # elsif /^[0-9]+$/.match(val)
        #   nums.push(val)
        # else
        #   raise Exception.new
        # end

        raise InvalidNewLineException.new if starts_with_new_line?(val)
        curr_vals = val.split(/\n/).reject(&:empty?)

        curr_vals.each do |c_val|
          c_num = c_val.to_i
          if c_num < 0 || !is_a_number?(c_val)
            raise NegativeNumberException.new
          elsif c_num <= THRESHOLD_NUMBER
            nums.push(c_num)
          end
        end
      end

      nums
    end

    private

      def starts_with_new_line?(str)
        is_char_new_line?(str[0])
      end

      def is_a_number?(val)
        /^[0-9]+$/.match(val)
      end

  end
end
