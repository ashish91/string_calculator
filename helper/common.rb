require_relative "constants.rb"

module Helper
  module Common
    include Helper::Constants

    def is_char_new_line?(ch)
      (ch == NEW_LINE || ch == WINDOWS_NEW_LINE)
    end

  end
end
