module Paranoic
  class Role < ActiveRecord::Base
    attr_accessible :name, :owner_id, :owner_type
  end
end
