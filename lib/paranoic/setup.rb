module Paranoic
  module Setup

    def setup
      yield if block_given?
      require 'paranoic/integration'
    end

  end
end
