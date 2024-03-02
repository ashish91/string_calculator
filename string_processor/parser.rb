require_relative 'delimiter_extractor.rb'

module StringProcessor
  class Parser

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

        raise Exception.new if val[0] == Helper::Constants::NEW_LINE
        curr_vals = val.split(/\n/).reject(&:empty?)

        curr_vals.each do |c_val|
          if c_val.to_i < 0 || !is_a_number?(c_val)
            raise Exception.new
          else
            nums.push(c_val.to_i)
          end
        end
      end

      nums
      # sum = 0
      # curr = 0

      # str.each_char do |ch|
      #   if /[0-9]/.match(ch)
      #     curr += ch.to_i
      #   else
      #     sum += curr
      #   end
      # end

      # sum
    end

    def is_a_number?(val)
      /^[0-9]+$/.match(val)
    end

  end
end
