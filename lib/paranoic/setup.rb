module Paranoic
  module Setup

    def setup
      yield if block_given?
    end

  end
end
