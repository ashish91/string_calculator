require_relative 'delimiter_extractor.rb'
require_relative "../helper/constants.rb"

require_relative "../exceptions/invalid_new_line_exception.rb"
require_relative "../exceptions/negative_number_exception.rb"

module StringProcessor
  class Parser
    include Helper::Constants
    include Helper::Common

    def parse(str, delim)
      arr = str.split(delim)

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
          if c_val.to_i < 0 || !is_a_number?(c_val)
            raise NegativeNumberException.new
          else
            nums.push(c_val.to_i)
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
