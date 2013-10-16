module Paranoic
  class Role < ActiveRecord::Base
    attr_accessible :name, :owner_id, :owner_type

    has_many :attribute_permissions
    has_and_belongs_to_many :job_descriptions
  end
end
